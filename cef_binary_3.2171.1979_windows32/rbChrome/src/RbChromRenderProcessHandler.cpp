#define _CRT_SECURE_NO_DEPRECATE

#include "stdio.h"
#include "FFIBridge.h"
#include "mruby.h"
#include "mruby/compile.h"
#include "mruby_cef_v8.h"
#include "RbChromeRenderProcessHandler.h"

RbChromeRenderProcessHandler::RbChromeRenderProcessHandler() {}

extern FFIBridge ffiBridge;

void RbChromeRenderProcessHandler::OnContextCreated(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) {
   mrb_state* mrb = mrb_open();
   FILE* extensions_script = fopen("extensions.rb", "r");
   if (extensions_script != NULL) {
      mrb_load_file(mrb, extensions_script);
   }
}