Lamina (alpha)
==============

A framework for developing desktop apps with web technologies.

&#x2713; Ruby <br/>
&#x2713; JavaScript <br/>
&#x2713; HTML <br/>
&#x2713; SVG <br/>
&#x2713; CSS <br/>

Lamina is similar in spirit to node-webkit, or atom-shell. It provides a Chromium shell for your
application's UI. This lets you develop your UI like a web app, while giving you access to the underlying
system like a native app.

Under the hood, lamina is CEF3 with mruby embedded. It provides some convenience such as launching a web server
(of your choosing) that dies with the browser. This lets you use full-blown CRuby, nodejs, or any other server
side technology along with your application, while maintaining a desktop app feel. If your needs are less complex,
you can build the entire application in JavaScript and/or mruby (and html, css, etc.).

App Structure
-------------

Your app might look something like this:

```
myApp/
  - on_app_started.rb
  - server.rb
  - cache/
  - public/
    - css/
    - js/
    index.html
```

And your files might contain something like this:

`on_app_started.rb`

```Ruby
# Using `rubyw` to avoid spawning a console window
Lamina.load_server "rubyw", "./server.rb"
# The title to display on the window
Lamina.set_window_title "TODO MVC - As performed by Sinatra"
# Setting the cache path allows local storage usage and persistence
Lamina.set_cache_path "cache"
```

`server.rb`

```Ruby
require 'sinatra'

enable :run

get '/' do
  send_file "#{settings.public_folder}/index.html"
end
```

Installation
------------

- Download or clone the `binaries-win` branch of this repo
- Put the runtime/ directory on your path (feel free to rename it to "lamina" or whatever suits you)

Running a Sample
----------------

After installing lamina, you can run any of the included samples (in the `samples/` directory of the `binaries-win` branch)
by running `lamina` in the containing folder. (They will expect you to have ruby installed already).

Ex:

```shell
$ cd C:\PATH\TO\LAMINA\samples\mruby_extensions
$ lamina
```

The samples include

- google: A minimalist lamina app run
- todo: TODO-MVC running in a lamina app
  + To run the todo sample, you'll have to run `bower update` in 
    the `samples\todo\public` directory to pull down some dependencies
- mruby_extensions: A comprehensive set of demos showing how to interact with JavaScript from Ruby
  in a lamina application

The `todo` sample looks like this...

![alt tag](https://raw.githubusercontent.com/jbreeden/rb-chrome/master/images/sample.png)

Platform Support
----------------

Windows only at the moment. Also expects `ruby` to be on your path.
