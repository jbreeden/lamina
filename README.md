rb-chrome (alpha)
=================

A framework for developing desktop apps with web technologies.

&#x2713; Ruby <br/>
&#x2713; JavaScript <br/>
&#x2713; HTML <br/>
&#x2713; SVG <br/>
&#x2713; CSS <br/>

rb-chrome is similar in spirit to node-webkit, or atom-shell. It provides a Chromium shell for your
application's UI. This lets you develop your UI like a web app, while giving you access to the underlying
system like a native app.

App Structure
-------------

The minimal setup for a client-server mode rb-chrome app is just a `server.rb` file. 

- `server.rb` is `require`-ed by rb-chrome in a special server process. 
- It's expected that you will have started your web server of choice within that process after `server.rb` has been executed.

Some optional components include 

- A `browser.rb` script to customize the browser
- A directory to store the browser's cached data (like localstorage)
- Any html/js/css files you'd like to serve in your app

Your app might look something like this:

```
myApp/
  - browser.rb
  - server.rb
  - cache/
  - public/
    - css/
    - js/
    index.html
```

And your files might contain something like this:

`browser.rb`

```Ruby
RbChrome::Browser.window_title = "TODO MVC - as performed by Sinatra"
RbChrome::Browser.cache_path = "#{File.dirname(__FILE__)}/cache"
```

`server.rb`

```Ruby
require 'sinatra'

enable :run
set :port, $RB_CHROME_OPTIONS[:port]

get '/' do
  send_file "#{settings.public_folder}/index.html"
end
```

Running a Sample
----------------

The samples directory in this repo contains a demo of [TODO MVC](http://todomvc.com/) running as a desktop app.

It looks like this...

![alt tag](https://raw.githubusercontent.com/jbreeden/rb-chrome/master/images/sample.png)

rb-chrome has not been properly gemified yet, so for now you run the sample with the following steps

- Download or clone this repo
- Put the bin/ directory on your path
- Run `rake runtime:release:build`
- `cd` into the samples/sinatra/public/ directory
- Run `bower update`
- `cd` into the samples/sinatra/ directory
- Run `rb-chrome`

Application Types
-----------------

Currently only a client-server app type is availabe. In a client-server app, your Ruby code runs in a web server,
and your UI talks to it by the usual means (ajax, web sockets, etc). The browser and server are both started 
automatically when you run `rb-chrome` in the directory containing your application. rb-chrome takes care
of associating the processes so that if the browser is closed by the user or OS, the server exits as well.

A server-less app type is in development. With a server-less app your ruby code will execute in the same process as
the browser. This eliminates the need for a web server, but does increase complexity and can make sharing code between
web and desktop versions of the same app more difficult.

Platform Support
----------------

Windows only at the moment. Also expects `ruby` to be on your path.
