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

- [mruby-cef](https://github.com/jbreeden/mruby-cef), which provides mruby bindings to the Chromium Embedded Framework and the lamina executable
- [mruby-apr](https://github.com/jbreeden/mruby-apr), which provides a portable runtime library for mruby based on the Apache Portable Runtime
- [mruby-nanomsg](https://github.com/jbreeden/mruby-nanomsg), which is in its infancy. At the moment it just links nanomsg with mruby (which is used by mruby-cef)

Some third-part gems are also included:

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

App Structure
-------------

Your app will look something like this:

```
myApp/
  - lamina_options.rb
  - server.rb
  - cache/
  - public/
    - css/
    - js/
    index.html
```

Note that only the `lamina_options.rb` is required.

Your files might contain something like this:

`lamina_options.rb`

```Ruby
# If you like, you can spawn a web server to serve your app
# This lets you integrate full CRuby, nodejs,
# or any other server-side techonology into your app
server_port = APR::TCP.get_open_port
spawn "rubyw.exe", "./server.rb", "-p", server_port

# Tell lamina to load the app we just spawned
Lamina.load_url "http://localhost:#{server_port}"

# The title to display on the window
Lamina.set_window_title "TODO MVC - As performed by Sinatra"

# Setting the cache path allows local storage usage and persistence
Lamina.set_cache_path "cache"
```

`server.rb`

```Ruby
require 'sinatra'

# lamina creates the `.lamina` file on launch, and maintains
# a shared lock until it closes (or is terminated)
# So, as soon as we're able to get an exclusive lock on this file,
# the app is closed and the server should exit too.
Thread.new do
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

Platform Support
----------------

Windows only at the moment.
