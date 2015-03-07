$lib_dir = "#{File.expand_path File.dirname(__FILE__)}/../lib"
$: << $lib_dir

require 'socket'
require 'fileutils'
require 'timeout'
require 'ipc'

# Configuration
# -------------

if ARGV.length > 0
  app_dir = ARGV[0]
else
  app_dir = "."
end

$rbchromedata_path = File.expand_path "#{app_dir}/.rbchromedata"
$server_lock_file = File.expand_path "#{app_dir}/server_lock"
$server_script = File.expand_path "#{app_dir}/server.rb"
$browser_script = File.expand_path "#{app_dir}/browser.rb"
$browser_proc_path = File.expand_path "#{File.dirname(__FILE__)}/rbChromeBrowserProc.rb"
$server_proc_path = File.expand_path "#{File.dirname(__FILE__)}/rbChromeSinatraProc.rb"

# Add the runtime directory to the path so windows can find libcef and friends
ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__))}/../runtime;#{ENV['PATH']}"

# Helper Methods
# --------------

def get_free_port
  dummy_server = TCPServer.new 0
  port = dummy_server.addr[1]
  dummy_server.close
  port
end

def get_new_proc_info
  {
    main_ipc_port: get_free_port,
    server_port: get_free_port,
    server_ipc_port: get_free_port,
    browser_ipc_port: get_free_port
  }
end

def server_command
  "ruby -I #{$lib_dir} " +
  "#{$server_proc_path} " +
  "--port #{$proc_info[:server_port]} " +
  "--ipc-port #{$proc_info[:server_ipc_port]} " +
  "--browser-port #{$proc_info[:browser_ipc_port]} " +
  $server_script
end

def browser_command
  "ruby -I #{$lib_dir} " +
  "#{$browser_proc_path} " +
  "--url http://localhost:#{$proc_info[:server_port]} " +
  "--ipc-port #{$proc_info[:browser_ipc_port]} " +
  $browser_script
end

def server_running?
  unless File.exists? $server_lock_file
    File.open($server_lock_file, 'w') { |f| f.puts 'Just a lock file' }
  end

  puts "Checking for running instance of server"
  server_lock_file = File.open($server_lock_file, 'r')
  timeout (0.2) do
    server_lock_file.flock(File::LOCK_EX)
  end
  false
rescue Exception => ex
  true
end

# Run the application
# -------------------

if server_running?
  $proc_info = eval(File.read($rbchromedata_path))
  # Can't launch a new browser process via rbChromeBrowserProc.rb
  # because they cannot share disk cache if they aren't aware of
  # each other. Instead, tell the main process to open a new window.
  puts "App is already running. Opening a new window."
  IPC.get_proc($proc_info[:browser_ipc_port]).execute_javascript(
    script: "window.open('/')",
    window_pattern: /.*/,
    firstMatch: true
  )
else
  $proc_info = get_new_proc_info
  File.open($rbchromedata_path, 'w') { |f| f.puts $proc_info }
  puts "Starting server: #{server_command}"
  server_pid = spawn server_command
  # For now extensions are loaded from the CWD in the browser proc,
  # so we chdir over there before launching this process
  Dir.chdir app_dir do
    puts "Starting browser: #{browser_command}"
    browser_pid = spawn browser_command
  end
  Process.wait(server_pid)
end
