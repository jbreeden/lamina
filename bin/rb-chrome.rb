lib_dir = "#{File.dirname(__FILE__)}/../lib"

require 'socket'

def get_free_port
  dummy_server = TCPServer.new 0
  port = dummy_server.addr[1]
  dummy_server.close
  port
end

server_port = get_free_port
master_ipc_port = get_free_port
server_ipc_port = get_free_port
browser_ipc_port = get_free_port

# Add the runtime directory to the path so windows can find libcef and friends
ENV['PATH'] = "#{File.dirname(__FILE__)}/../runtime;#{ENV['PATH']}"

browser_proc_path = "#{File.dirname(__FILE__)}/rbChromeBrowserProc.rb"
server_proc_path = "#{File.dirname(__FILE__)}/rbChromeSinatraProc.rb"

server_id = spawn(
  "ruby -I #{lib_dir} " +
  "#{server_proc_path} " +
  "--port #{server_port} " +
  "--ipc-port #{server_ipc_port} " +
  "--juliet-port #{browser_ipc_port} "
)

browser_id = spawn(
  "ruby -I #{lib_dir} " +
  "#{browser_proc_path} " +
  "--url http://localhost:#{server_port} " +
  "--ipc-port #{browser_ipc_port}"
)

Process.wait(server_id)
