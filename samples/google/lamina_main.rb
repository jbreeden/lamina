Lamina.on_launch do
  Lamina.url = "http://google.com"
  Lamina.window_title = "Lamina"
  Lamina.use_page_titles = false
  Lamina.remote_debugging_port = 8888
end

Lamina.on_relaunch do
  Lamina.open_new_window
end

Lamina.run
