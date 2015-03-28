server_port = APR::TCP.get_open_tcp_port
spawn "rubyw.exe", "./server.rb", "-p", server_port.to_s

Lamina.load_url "http://localhost:#{server_port}"
Lamina.set_window_title "TODO MVC - As performed by Sinatra"
Lamina.set_cache_path "cache"
Lamina.use_page_titles false
Lamina.set_remote_debugging_port 8888
