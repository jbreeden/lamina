# `on_launch` will only be called the first time the app is launched.
# If there is a running instance already, `on_relaunch` will be called instead
Lamina.on_launch do
  Lamina.server_port = APR::TCP.get_open_port
  Lamina.window_title = "Lamina JavaScript Integration Tests"
  Lamina.use_page_titles = false
  Lamina.cache_path = "cache"
  Lamina.remote_debugging_port = 8888
  Lamina.url = "http://localhost:#{Lamina.server_port}"
  
  popen ["ruby", "./server.rb", "-p", Lamina.server_port.to_s]
  # If you're using Webrick, the server may need a sec to startup.
  # Quick-and-dirty hack to avoid a load error is just to sleep.
  sleep 2
end

Lamina.on_relaunch do
  Lamina.open_new_window
end

Lamina.run
