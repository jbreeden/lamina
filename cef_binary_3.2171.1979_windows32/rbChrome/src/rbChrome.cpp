#include <iostream>
#include <string>
#include <iostream>
#include <sstream>
#include <list>
#include "include/cef_app.h"
#include "include/cef_browser.h"
#include "include/cef_command_line.h"
#include "include/wrapper/cef_helpers.h"
#include "include/base/cef_bind.h"
#include "include/wrapper/cef_closure_task.h"
#include "include/wrapper/cef_helpers.h"
#include "include/cef_client.h"
#include "include/cef_sandbox_win.h"
#include "include/cef_runnable.h"
#include "rbChrome.h"
#include "RbChromeHandler.h"
#include "RbChromeApp.h"
#include "FFIBridge.h"

using namespace std;

FFIBridge ffiBridge;

#ifdef _WIN32
#define CEF_USE_SANDBOX
#endif

#if __cplusplus
extern "C" {
#endif

   EXPORT void rb_chrome_set_url(char* url) {
      ffiBridge.appUrl = url;
   }

   EXPORT void rb_chrome_set_sub_process(char* sub_process_name) {
      ffiBridge.subProcessName = sub_process_name;
   }

   EXPORT void rb_chrome_set_window_title(char* window_title) {
      ffiBridge.windowTitle = window_title;
   }

   EXPORT void rb_chrome_set_cache_path(char* cache_path) {
      ffiBridge.cachePath = cache_path;
   }

   EXPORT void rb_chrome_set_remote_debugging_port(int port) {
      ffiBridge.remoteDebuggingPort = port;
   }

   EXPORT void rb_chrome_execute_javascript(char* script, char* window_pattern, bool firstMatch) {
      auto handler = RbChromeHandler::GetInstance();
      CefPostTask(TID_UI, NewCefRunnableMethod(handler, &RbChromeHandler::ExecuteJavaScript, script, window_pattern, firstMatch));
   }

   EXPORT void rb_chrome_use_page_titles(bool enabled) {
      ffiBridge.usePageTitles = enabled;
   }

   EXPORT int rb_chrome_start() {

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
      CefRefPtr<RbChromeApp> app(new RbChromeApp);
      app.get()->url = ffiBridge.appUrl;
      
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
      CefString(&settings.browser_subprocess_path).FromASCII(ffiBridge.subProcessName.c_str());

      if (ffiBridge.cachePath.length() > 0) {
         CefString(&settings.cache_path).FromASCII(ffiBridge.cachePath.c_str());
      }

      settings.remote_debugging_port = ffiBridge.remoteDebuggingPort;

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