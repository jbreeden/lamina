#ifndef LAMINA_RENDER_PROCESS_HANDLER_H
#define LAMINA_RENDER_PROCESS_HANDLER_H

#include <string>
#include "include/cef_render_process_handler.h"

class LaminaRenderProcessHandler : 
   public CefRenderProcessHandler {
public:
   LaminaRenderProcessHandler();

   virtual void OnContextCreated(
      CefRefPtr<CefBrowser> browser,
      CefRefPtr<CefFrame> frame,
      CefRefPtr<CefV8Context> context) OVERRIDE;

private:
   // Include the default reference counting implementation.
   IMPLEMENT_REFCOUNTING(LaminaRenderProcessHandler);
};

#endif /* LAMINA_RENDER_PROCESS_HANDLER_H */