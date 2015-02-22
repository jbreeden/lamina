#ifndef RBCHROMEHANDLER_H
#define RBCHROMEHANDLER_H

#include <iostream>
#include <string>
#include <iostream>
#include <sstream>
#include <list>
#include "include/cef_client.h"

using namespace std;

class RbChromeHandler : public CefClient,
   public CefDisplayHandler,
   public CefLifeSpanHandler,
   public CefLoadHandler {
public:
   RbChromeHandler();
   ~RbChromeHandler();

   // Provide access to the single global instance of this object.
   static RbChromeHandler* GetInstance();

   // CefClient methods:
   virtual CefRefPtr<CefDisplayHandler> GetDisplayHandler() OVERRIDE{
      return this;
   }
      virtual CefRefPtr<CefLifeSpanHandler> GetLifeSpanHandler() OVERRIDE{
      return this;
   }
      virtual CefRefPtr<CefLoadHandler> GetLoadHandler() OVERRIDE{
      return this;
   }

      // CefLifeSpanHandler methods:
   virtual void OnAfterCreated(CefRefPtr<CefBrowser> browser) OVERRIDE;
   virtual bool DoClose(CefRefPtr<CefBrowser> browser) OVERRIDE;
   virtual void OnBeforeClose(CefRefPtr<CefBrowser> browser) OVERRIDE;

   // CefLoadHandler methods:
   virtual void OnLoadError(CefRefPtr<CefBrowser> browser,
      CefRefPtr<CefFrame> frame,
      ErrorCode errorCode,
      const CefString& errorText,
      const CefString& failedUrl) OVERRIDE;

   // Request that all existing browser windows close.
   void CloseAllBrowsers(bool force_close);

   bool IsClosing() const { return is_closing_; }

private:
   // List of existing browser windows. Only accessed on the CEF UI thread.
   typedef std::list<CefRefPtr<CefBrowser> > BrowserList;
   BrowserList browser_list_;

   bool is_closing_;

   // Include the default reference counting implementation.
   IMPLEMENT_REFCOUNTING(RbChromeHandler);
};

#endif /*RBCHROMEHANDLER_H*/