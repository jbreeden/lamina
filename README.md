Lamina (alpha)
==============

[![Join the chat at https://gitter.im/jbreeden/lamina](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/jbreeden/lamina?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

A framework for developing desktop apps with web technologies.

&#x2713; Ruby <br/>
&#x2713; JavaScript <br/>
&#x2713; HTML <br/>
&#x2713; SVG <br/>
&#x2713; CSS <br/>

Lamina is similar in spirit to node-webkit, or atom-shell. It provides a Chromium shell for your
application's UI. This lets you develop your UI like a web app, while giving you access to the underlying
system like a native app.

Under the hood, lamina is really just a Chromium Embedded Framework based app with mruby built-in. The standard mruby distribution doesn't include much of a standard library (compared to CRuby), but lamina defines the following gems:

- [mruby-lamina](https://github.com/jbreeden/mruby-lamina), which provides the `lamina` (and `laminaw` on Windows) executables.
- [mruby-cef](https://github.com/jbreeden/mruby-cef), which provides mruby bindings to the Chromium Embedded Framework
  + This allows you to write JavsScript extensions in Ruby (gasp!!!), call Ruby from JavaScript, and call JavaScript from Ruby.
- [mruby-apr](https://github.com/jbreeden/mruby-apr), which provides a portable runtime library for mruby based on the Apache Portable Runtime project.
- [mruby-nanomsg](https://github.com/jbreeden/mruby-nanomsg), which is in its infancy. At the moment it just links nanomsg with mruby (which is used by mruby-lamina)

Some third-part gems are also included to fill out the runtime library:

- [mruby-regexp-pcre](http://github.com/iij/mruby-regexp-pcre), bringing /regex/ to mruby
- [mruby-dir](http://github.com/iij/mruby-dir) providing a subset of the CRuby `Dir` methods
- [mruby-io](http://github.com/iij/mruby-io) providing IO and File methods
- [mruby-errno](http://github.com/iij/mruby-errno) which allows dealing with c errno based errors in Ruby

Installation
------------

- Download or clone the `binaries-win` branch of this repo
- Put the runtime/ directory on your path

Running a Sample
----------------

After installing lamina, you can run any of the included samples (in the `samples/` directory of the `binaries-win` branch)
by running `lamina` in the containing folder. (Some samples will expect you to have Ruby installed).

Ex:

```shell
$ cd C:/PATH/TO/LAMINA/samples/javascript_interop
$ lamina
```

The samples include

- google: A minimalist lamina app run
- todo: TODO-MVC running in a lamina app
  + To run the todo sample, you'll have to run `bower update` in
    the `samples\todo\public` directory to pull down some dependencies
- javascript_interop: A comprehensive set of demos showing how to interact with JavaScript from Ruby
  in a lamina application

The `todo` sample looks like this...

![alt tag](https://raw.githubusercontent.com/jbreeden/rb-chrome/master/images/sample.png)

Example Application
-------------------

Look in the `samples/` folder for examples of different types of applications that can be made with lamina.

This example demonstrates creating a lamina application that serves the UI from a sinatra app. Note that a server is not required
to create a lamina application, but this option allows you to utilize Ruby (as in MRI, JRuby, Rubinius...), Nodejs, or any server technology
you like to add functionality to your application.

The file structure for this app looks like this:

```
myApp/
  - lamina_main.rb
  - server.rb
  - cache/
  - public/
    - css/
    - js/
    index.html
```

Note that only the `lamina_main.rb` file is required for every lamina application.

In `lamina_main.rb`, you specify the options for launching your application. See the
[Lamina module documentation](https://github.com/jbreeden/mruby-lamina/blob/master/doc/mrblib/lamina.md) for complete API details.

```Ruby
# File: lamina_main.rb

# Specify the launch behavior (when no app instances are currently running)
Lamina.on_launch do
  # Configure the application
  # - Only needs to be done in `on_launch`
  # - When relaunching, the options set during the inital launch are loaded.
  Lamina.window_title = "TODO MVC - As performed by Sinatra"
  Lamina.use_page_titles = false
  Lamina.remote_debugging_port = 8888
  Lamina.server_port = APR::TCP.get_open_port
  Lamina.cache_path = "cache"
  Lamina.url = "http://localhost:#{Lamina.server_port}"

  # Start a sinatra application
  spawn "rubyw.exe", "./server.rb", "-p", Lamina.server_port.to_s

  # If you're using Webrick, the server may need a sec to startup.
  # Quick-and-dirty hack to avoid a load error is just to sleep.
  sleep 2
end

# Specify the relaunch behavior (when another app instance is already running)
Lamina.on_relaunch do
  Lamina.open_new_window
end

# Always call run. Lamina will figure out what to do from here.
Lamina.run

```

The sinatra app serving the UI for this application is defined in `server.rb`.

```Ruby
# File: server.rb

require 'sinatra'

# lamina creates the `.lamina` file on launch, and maintains
# a shared lock until it closes (or is terminated)
# So, as soon as we're able to get an exclusive lock on this file,
# the app is closed and the server should exit too.
Thread.new do
  # Give lamina plenty of time to grab the lock,
  # so the server doesn't exit immediately
  sleep 5
  File.open(".lamina", "r") do |lock_file|
    lock_file.flock(File::LOCK_EX)
    exit
  end
end

# Serve the index.html file when '/' is hit
get '/' do
  send_file "#{settings.public_folder}/index.html"
end

```

If you're familiar with web development, you can imagine what the contents for the `public/` folder and `index.html` look like.
It's just a web app, but it runs like a native app on a single machine.

Platform Support
----------------

Windows only at the moment.
