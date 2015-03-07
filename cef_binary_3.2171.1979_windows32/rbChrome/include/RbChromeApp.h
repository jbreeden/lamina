#ifndef RUBYCHROMEAPP_H
#define RUBYCHROMEAPP_H

#include <string>
#include "include/cef_app.h"

class RbChromeApp : public CefApp,
   public CefBrowserProcessHandler {
public:
   RbChromeApp();

   // CefApp methods:
   virtual CefRefPtr<CefBrowserProcessHandler> GetBrowserProcessHandler() OVERRIDE 
   { 
      return this; 
   }

   virtual CefRefPtr<CefRenderProcessHandler> GetRenderProcessHandler() OVERRIDE;

   // CefBrowserProcessHandler methods:
   virtual void OnContextInitialized() OVERRIDE;

   std::string url;

private:
   // Include the default reference counting implementation.
   IMPLEMENT_REFCOUNTING(RbChromeApp);
};

#endif /* RUBYCHROMEAPP_H */