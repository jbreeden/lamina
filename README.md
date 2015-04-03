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


Application Types
-----------------

Look in the `samples/` folder for examples of different types of applications that can be made with lamina.

### Minimal

A minimal lamina application is one that simply runs a browser with mruby embedded. You can load any URL you like, including `file://*` URLs.
This allows you to write some simple html files to disk, sprinkle in some JavaScript and mruby, and run them with lamina.

All you have to do is define a `lamina_main.rb` file like
[`this one`](https://github.com/jbreeden/lamina/blob/master/samples/google/lamina_main.rb)
and run `lamina` in the directory containing that file.

`lamina_main.rb` is the entry point for your application, and is the only required file. Inside of this file you call methods on the `Lamina` module to configure and launch the application. Check out the
[Lamina module documentation](https://github.com/jbreeden/mruby-lamina/blob/master/doc/mrblib/lamina.md)
for complete API details.

_DANGER: _

_Keep in mind that lamina defines some JavaScript extensions, like the `ruby` function. This runs ruby code in the browser that can talk back to JavaScript.
It call also talk to the local file system, spawn processes, etc. So it is not advised (and downright dangerous) to run code from arbitrary websites.
You could, on the other hand, serve applications from your own central server behind a secure firewall - or preferably on the localhost. These extensions
will be configurable, and disabled by default in the future._

### Client-Server

Lamina makes it easy to launch a web server on the localhost with your application, and have it automatically terminate when all windows are closed.
This allows you to utilize Ruby (as in MRI, JRuby, Rubinius...), Nodejs, or any server technology you'd like to add
functionality to your application.

The process goes like this:
- Create a `lamina_main.rb` file that spawns the server, and tells lamina to load its URL.
- When the first instance of the app is launch, lamina automatically creates a `.lamina` file,
  and grabs a shared lock on it.
- In the server, you attempt to get an exclusive lock on `.lamina`. Once you're able to, you know
  all browser windows have been close, and you can exit the server process.

[The todo sample](https://github.com/jbreeden/lamina/tree/master/samples/todo) demonstrates this process with a sinatra application.

The file structure for this app looks like this:

```
todo/
  - lamina_main.rb
  - server.rb
  - public/
    - css/
    - js/
    index.html
```

Checkout the [`todo/lamina_main.rb`](https://github.com/jbreeden/lamina/blob/master/samples/todo/lamina_main.rb) and
[`todo/server.rb`](https://github.com/jbreeden/lamina/blob/master/samples/todo/server.rb) files to see how the locking works.

The contents of the `public/` folder is just a copy of TODO-MVC. It's a web application just like any other, but it's served
from the localhost, and the server process stops whenever all open windows are closed.

Running a Lamina Application
----------------------------

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

Platform Support
----------------

Windows only at the moment.
