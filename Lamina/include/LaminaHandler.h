#ifndef LAMINAHANDLER_H
#define LAMINAHANDLER_H

#include <iostream>
#include <string>
#include <iostream>
#include <sstream>
#include <list>
#include <Windows.h>
#include "include/cef_client.h"
#include "include/wrapper/cef_helpers.h"
#include "cefsimple/simple_handler.h"
#include "LaminaLifeSpanHandler.h"
#include "LaminaOptions.h"

using namespace std;

class LaminaHandler : public CefClient,
   public CefDisplayHandler,
   public CefLoadHandler {
public:
   LaminaHandler();
   ~LaminaHandler();

   // Provide access to the single global instance of this object.
   static LaminaHandler* GetInstance();

   // CefClient methods:
   virtual CefRefPtr<CefDisplayHandler> GetDisplayHandler() OVERRIDE {
      return this;
   }
   virtual CefRefPtr<CefLifeSpanHandler> GetLifeSpanHandler() OVERRIDE {
      return LaminaLifeSpanHandler::GetInstance();
   }
   virtual CefRefPtr<CefLoadHandler> GetLoadHandler() OVERRIDE {
      return this;
   }

   // CefDisplayHandler methods:
   virtual void OnTitleChange(CefRefPtr<CefBrowser> browser, const CefString& title) OVERRIDE {
      if (LaminaOptions::use_page_titles) {
         CEF_REQUIRE_UI_THREAD();
         // Set the frame window title bar
         CefWindowHandle hwnd = browser->GetHost()->GetWindowHandle();
         SetWindowTextW(hwnd, title.c_str());
      }
   }

   // CefLoadHandler methods:
   virtual void OnLoadError(CefRefPtr<CefBrowser> browser,
      CefRefPtr<CefFrame> frame,
      ErrorCode errorCode,
      const CefString& errorText,
      const CefString& failedUrl) OVERRIDE;

private:
   // Include the default reference counting implementation.
   IMPLEMENT_REFCOUNTING(LaminaHandler);
};

#endif /*LAMINAHANDLER_H*/