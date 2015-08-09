# `on_launch` block will be called if no other app instances are runing.
Lamina.on_launch do
  Lamina.window_title = "TODO MVC - As performed by Sinatra"
  Lamina.use_page_titles = false
  Lamina.remote_debugging_port = 8889

  # You don't *have* to tell lamina what port you're running your server on,
  # but if you're running on different ports each time, the localstorage data
  # from previous runs will not be accessible. If you tell lamina what port
  # you're running on each time you launch, it will fix this issue for you.
  # (Works for apps run on localhost only, otherwise same origin policy applies)
  Lamina.server_port = 8888
  Lamina.cache_path = "cache"

  # Tell lamina to load the page we're about to serve up on localhost
  Lamina.url = "http://localhost:#{Lamina.server_port}"

  # Spawn our sinatra application
  IO.popen ["ruby", "./server.rb", "-p", 8888]

  # If you're using Webrick, the server may need a sec to startup.
  # Quick-and-dirty hack to avoid a load error is just to sleep.
  # sleep 2
end

# `on_relaunch` block will be called if there is an instance of the app running already.
Lamina.on_relaunch do
  # `open_new_window` sends a message to the existing app to
  # spawn a new browser window. This is not only much faster than
  # spawning a new application from scratch, it also allow the windows
  # to share localstorage and receive storage events.
  Lamina.open_new_window
end

# Always need to call `run`
# Lamina will figure out if the app is launching, relaunching,
# or is being spawned as a CEF process
Lamina.run
