#include <iostream>
#include <string>
#include <iostream>
#include <sstream>
#include <list>
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

#if __cplusplus
extern "C" {
#endif

   int lamina_start() {
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