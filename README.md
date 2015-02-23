rb-chrome (Alpha)
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

Currently only a client-server mode is availabe. In client-server mode, your Ruby code runs in a web server,
and your UI talks to it by the usual means (ajax, web sockets, etc). The browser and server are both started 
automatically when you run `rb-chrome` in the directory containing your application. rb-chrome takes care
of associating the processes so that if the browser is closed by the user or OS, the server exits as well.

A server-less mode is in development. In this mode your ruby code will execute in the same process as
the browser. This eliminates the need for a web server, but does involve learning some new APIs.

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

If you run `rb-chrome` in your app's directory, you might see something like this:

![alt tag](https://raw.githubusercontent.com/jbreeden/rb-chrome/master/images/sample.png)

Running a Sample
----------------

The samples directory in this repo contains a bare-bones client-server application you can run with rb-chrome.
(It's actually just the Polymer version of TODO MVC).

rb-chrome has not been properly gemified yet, so for now you run the sample with the following steps

- Download or clone this repo
- Put the bin/ directory on your path
- Run `rake runtime:release:build`
- `cd` into the samples/sinatra/ directory
- Run `rb-chrome`

Platform Support
----------------

Windows only at the moment.