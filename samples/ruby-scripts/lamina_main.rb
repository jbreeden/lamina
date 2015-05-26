Lamina.on_launch do
  Lamina.url = "file:///#{File.expand_path('.')}/index.html"
  Lamina.remote_debugging_port = 8888
end

Lamina.run
