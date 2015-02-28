/*

simpleChromeProc.exe
====================

Description
-----------

Provides a basic executable that CEF can use to launch its subprocesses.
Basically just links to rbChrome.dll (which itself links to libcef) and
calls the entry point function, `rb_chrome_start`. Notably, this executable
does not run ruby as the subprocess (as in rbChromeProc.exe), so extensibility
via Ruby is not available.

Uses
----

This is mainly used for running an rbChrome application in client-server mode.
Client-server mode involves running a standard chrome browser that loads the
'/' route of the server application. The server process is tied to the lifetime
of the broswer (via IPC polling at the moment) such that if the browser is
closed, or terminate for any reason, the server will exit as well.

*/


#include <iostream>
#include <string>
#include "rbChrome.h"
#include "Windows.h"

using namespace std;

int WINAPI WinMain(_In_  HINSTANCE hInstance,
   _In_opt_  HINSTANCE hPrevInstance,
   _In_  LPSTR lpCmdLine,
   _In_  int nCmdShow) {
   rb_chrome_start();
}