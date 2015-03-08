#define _CRT_SECURE_NO_DEPRECATE

#include "stdio.h"
#include "errno.h"
#include "mruby.h"
#include "mruby/compile.h"
#include "mruby_cef_v8.h"
#include "LaminaRenderProcessHandler.h"

LaminaRenderProcessHandler::LaminaRenderProcessHandler() {}

void LaminaRenderProcessHandler::OnContextCreated(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) {
   mrb_state* mrb = mrb_open();

   FILE* extensions_script = fopen("./lamina_extensions.rb", "r");
   if (extensions_script != NULL) {
      mrb_load_file(mrb, extensions_script);
   }
   else {
      if (errno != ENOENT) {
         mrb_load_string(mrb, "Cef::V8.exec 'alert(\"Could not read lamina_extensions.rb\")'");
      }
   }
}