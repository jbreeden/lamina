#include <ws2tcpip.h>
#include <iostream>
#include <string>
#include <iostream>
#include <sstream>
#include <list>
#include <cstdio>
#include "include/cef_app.h"
#include "include/cef_browser.h"
#include "include/cef_command_line.h"
#include "include/wrapper/cef_helpers.h"
#include "include/wrapper/cef_closure_task.h"
#include "include/wrapper/cef_helpers.h"
#include "include/cef_client.h"
#include "include/cef_sandbox_win.h"
#include "include/cef_runnable.h"
#include "Lamina.h"
#include "LaminaHandler.h"
#include "LaminaApp.h"
#include "LaminaOptions.h"
#include "Shobjidl.h"
#include "apr_file_io.h"
#include "apr_thread_proc.h"
#include "apr_network_io.h"

using namespace std;

extern LaminaOptions laminaOptions;

// Notes on sandboxing:
//  - On windows, this currently only works if the sub-process exe is the same exe as the main process
//  - With sandboxing enabled, render processes cannot access system resources like networking/files
//  - Currently running without sandboxing to allow the render process to load mruby scripts
//    + This also allows javascript extensions to access resources without going through IPC
//    + This isn't great from a security perspective. Will need to work around this and re-enable sandboxing
//      as soon as a decent story is available for creating JS extensions with mruby scripts in a sandboxed environment.
//#ifdef _WIN32
//#define CEF_USE_SANDBOX
//#endif

#define LOCK_FILE "lamina.lock"

#if __cplusplus
extern "C" {
#endif

void lamina_ensure_lock_file_exists(char* file_name) {
   auto f = fopen(file_name, "r");
   if (f == NULL && errno == ENOENT) {
      f = fopen(file_name, "w");
      fclose(f);
   }
}

void lamina_try_launch_server(char* file_name, apr_pool_t* pool) {
   apr_file_t* lock_file;
   apr_file_open(&lock_file, file_name, APR_READ, APR_FPROT_OS_DEFAULT, pool);
   if (apr_file_lock(lock_file, APR_FLOCK_EXCLUSIVE | APR_FLOCK_NONBLOCK) == APR_SUCCESS) {
      // Get open port
      apr_socket_t *socket;
      apr_socket_create(&socket, APR_INET, SOCK_STREAM, APR_PROTO_TCP, pool);
      apr_sockaddr_t *addr;
      apr_sockaddr_info_get(&addr, NULL, APR_INET, 0, 0, pool);
      apr_socket_bind(socket, addr);
      apr_socket_addr_get(&addr, apr_interface_e::APR_LOCAL, socket);
      char port_argument[10];
      sprintf(port_argument, "-p %d", addr->port);

      apr_procattr_t* procattr;
      apr_procattr_create(&procattr, pool);
      apr_procattr_cmdtype_set(procattr, APR_PROGRAM_PATH);
      apr_proc_t proc;
      char* ruby = "ruby.exe";
      char* script = "server.rb";
      char* argv[] = { ruby, script, port_argument, NULL };
      apr_proc_create(&proc, ruby, argv, NULL, procattr, pool);
      apr_file_unlock(lock_file);
      apr_socket_close(socket);
   }
}

void lamina_get_shared_lock(char* file_name, apr_pool_t* pool) {
   apr_file_t* file;
   apr_file_open(&file, file_name, APR_READ, NULL, pool);
   apr_status_t lock_status = apr_file_lock(file, APR_FLOCK_SHARED);
}

int lamina_start() {
   apr_initialize();
   apr_pool_t* pool;
   apr_pool_create(&pool, NULL);
   lamina_ensure_lock_file_exists(LOCK_FILE);
   lamina_try_launch_server(LOCK_FILE, pool);
   lamina_get_shared_lock(LOCK_FILE, pool);


   LaminaOptions::load();
   SetCurrentProcessExplicitAppUserModelID(L"jbreeden.Lamina");

#ifdef DEBUG
   cout << "New Main Process" << endl;
#endif

   void* sandbox_info = NULL;

#if defined(CEF_USE_SANDBOX)
   // Manage the life span of the sandbox information object. This is necessary
   // for sandbox support on Windows. See cef_sandbox_win.h for complete details.
   CefScopedSandboxInfo scoped_sandbox;
   sandbox_info = scoped_sandbox.sandbox_info();
#endif

   // Provide CEF with command-line arguments.
   CefMainArgs main_args;
   // SimpleApp implements application-level callbacks. It will create the first
   // browser instance in OnContextInitialized() after CEF has initialized.
   CefRefPtr<LaminaApp> app(new LaminaApp);
   app.get()->url = laminaOptions.appUrl;

#ifdef DEBUG
   cout << "APP URL: " << app.get()->url << endl;
#endif

   // CEF applications have multiple sub-processes (render, plugin, GPU, etc)
   // that share the same executable. This function checks the command-line and,
   // if this is a sub-process, executes the appropriate logic.
   int exit_code = CefExecuteProcess(main_args, app.get(), sandbox_info);
   if (exit_code >= 0) {
      // The sub-process has completed so return here.
      return exit_code;
   }

   // Specify CEF global settings here.
   CefSettings settings;
   if (laminaOptions.subProcessName.length() > 0) {
      CefString(&settings.browser_subprocess_path).FromASCII(laminaOptions.subProcessName.c_str());
   }

   if (laminaOptions.cachePath.length() > 0) {
      CefString(&settings.cache_path).FromASCII(laminaOptions.cachePath.c_str());
   }

   settings.remote_debugging_port = laminaOptions.remoteDebuggingPort;

#if !defined(CEF_USE_SANDBOX)
   settings.no_sandbox = true;
#endif

   // Initialize CEF.
   CefInitialize(main_args, settings, app.get(), sandbox_info);

   // Run the CEF message loop. This will block until CefQuitMessageLoop() is
   // called.
   CefRunMessageLoop();

   // Shut down CEF.
   CefShutdown();

   return 0;
}

#if __cplusplus
}
#endif