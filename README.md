Lamina (alpha)
==============

(TODO: Readme is out of date. Began updating... but I have to go to Taco Bell.)

A framework for developing desktop apps with web technologies.

&#x2713; Ruby <br/>
&#x2713; JavaScript <br/>
&#x2713; HTML <br/>
&#x2713; SVG <br/>
&#x2713; CSS <br/>

Lamina is similar in spirit to node-webkit, or atom-shell. It provides a Chromium shell for your
application's UI. This lets you develop your UI like a web app, while giving you access to the underlying
system like a native app.

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
Lamina.load_server "ruby.exe", "./server.rb"
Lamina.set_window_title "TODO MVC - As performed by Sinatra"
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

Running a Sample
----------------

The samples directory in this repo contains a demo of [TODO MVC](http://todomvc.com/) running as a desktop app.

It looks like this...

![alt tag](https://raw.githubusercontent.com/jbreeden/rb-chrome/master/images/sample.png)

Lamina has not been properly gemified yet, so for now you run the sample with the following steps

- Download or clone this repo
- Put the bin/ directory on your path
- Run `rake runtime:release:build`
- `cd` into the samples/todo/public/ directory
- Run `bower update`
- `cd` into the samples/todo/ directory
- Run `lamina`

Platform Support
----------------

Windows only at the moment. Also expects `ruby` to be on your path.
