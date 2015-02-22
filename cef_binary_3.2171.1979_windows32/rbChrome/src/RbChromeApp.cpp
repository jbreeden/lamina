#include "RbChromeHandler.h"
#include "RbChromeApp.h"

extern string windowTitle;

RbChromeApp::RbChromeApp() {
}

void RbChromeApp::OnContextInitialized() {

   // Information used when creating the native window.
   CefWindowInfo window_info;

#if defined(OS_WIN)
   // On Windows we need to specify certain flags that will be passed to
   // CreateWindowEx().
   window_info.SetAsPopup(NULL, windowTitle);
#endif

   // RbChromeHandler implements browser-level callbacks.
   CefRefPtr<RbChromeHandler> handler(new RbChromeHandler());

   // Specify CEF browser settings here.
   CefBrowserSettings browser_settings;

   // Create the first browser window.
   CefBrowserHost::CreateBrowser(window_info, handler.get(), this->url, browser_settings, NULL);
}
