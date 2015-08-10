# `on_launch` block will be called if no other app instances are runing.
Lamina.on_launch do
  Lamina.window_title = "TODO MVC - As performed by Sinatra"
  Lamina.use_page_titles = false
  Lamina.remote_debugging_port = 8889
  Lamina.cache_path = "cache"
  Lamina.url = "http://localhost:#{Lamina.server_port}"
  IO.popen ["ruby", "./server.rb", "-p", 8888]
end

Lamina.on_relaunch do
  Lamina.open_new_window
end

Lamina.run
