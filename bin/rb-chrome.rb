lib_dir = "#{File.dirname(__FILE__)}/../lib"

require 'socket'
require 'fileutils'

def get_free_port
  dummy_server = TCPServer.new 0
  port = dummy_server.addr[1]
  dummy_server.close
  port
end

proc_info = {
  main_ipc_port: get_free_port,
  server_port: get_free_port,
  server_ipc_port: get_free_port,
  browser_ipc_port: get_free_port
}

# Add the runtime directory to the path so windows can find libcef and friends
ENV['PATH'] = "#{File.dirname(__FILE__)}/../runtime;#{ENV['PATH']}"

browser_proc_path = "#{File.dirname(__FILE__)}/rbChromeBrowserProc.rb"
server_proc_path = "#{File.dirname(__FILE__)}/rbChromeSinatraProc.rb"

server_command =
  "rubyw -I #{lib_dir} " +
  "#{server_proc_path} " +
  "--port #{proc_info[:server_port]} " +
  "--ipc-port #{proc_info[:server_ipc_port]} " +
  "--browser-port #{proc_info[:browser_ipc_port]} "

browser_command =
  "rubyw -I #{lib_dir} " +
  "#{browser_proc_path} " +
  "--url http://localhost:#{proc_info[:server_port]} " +
  "--ipc-port #{proc_info[:browser_ipc_port]} "

server_pid = spawn server_command
browser_pid = spawn browser_command

Process.wait(server_pid)
Process.wait(browser_pid)
