rb-chrome (Alpha)
=================

A framework for developing desktop apps with all your favorite technologies.

&#x2713; Ruby <br/>
&#x2713; JavaScript <br/>
&#x2713; HTML <br/>
&#x2713; SVG <br/>
&#x2713; CSS <br/>

rb-chrome is similar is spirit to node-webkit, or atom-shell. It provides a Chromium shell for your
application's UI. This lets you develop your UI like a web app, while giving you access to the underlying
system like a native app.

rb-chrome intends to support multiple modes of operation. Currently only a client-server mode is
availabe. In client-server mode, your Ruby code runs in a web server process, and your UI
talks to it by the usual means (ajax, web sockets, etc). This is the simplest development model
for rb-chrome apps. The browser and server are both started by simply running the `rb-chrome` command
in the directory containing your application. rb-chrome takes care of associating the processes so
that if the browser is closed by the user or OS, the server exits as well.

A server-less mode is in development. In this mode your ruby code will execute in the same process as
the browser. This eliminates the need for a web server, but does involve learning some new APIs.

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
