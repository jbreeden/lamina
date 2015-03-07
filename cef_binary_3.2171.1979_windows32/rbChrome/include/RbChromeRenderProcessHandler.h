#ifndef RB_CHROME_RENDER_PROCESS_HANDLER_H
#define RB_CHROME_RENDER_PROCESS_HANDLER_H

#include <string>
#include "include/cef_render_process_handler.h"

class RbChromeRenderProcessHandler : 
   public CefRenderProcessHandler {
public:
   RbChromeRenderProcessHandler();

   virtual void OnContextCreated(
      CefRefPtr<CefBrowser> browser,
      CefRefPtr<CefFrame> frame,
      CefRefPtr<CefV8Context> context) OVERRIDE;

private:
   // Include the default reference counting implementation.
   IMPLEMENT_REFCOUNTING(RbChromeRenderProcessHandler);
};

#endif /* RB_CHROME_RENDER_PROCESS_HANDLER_H */