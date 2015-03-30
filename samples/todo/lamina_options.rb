server_port = APR::TCP.get_open_port
spawn "rubyw.exe", "./server.rb", "-p", server_port.to_s

# If you're using Webrick, the server may need a sec to startup.
# Quick-and-dirty hack to avoid a load error is just to sleep.
sleep 2

Lamina.load_url "http://localhost:#{server_port}"
Lamina.set_window_title "TODO MVC - As performed by Sinatra"
Lamina.set_cache_path "cache"
Lamina.use_page_titles false
Lamina.set_remote_debugging_port 8888
