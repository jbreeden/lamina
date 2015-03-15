#define _CRT_SECURE_NO_DEPRECATE

#include "stdio.h"
#include "errno.h"
#include "mruby.h"
#include "mruby/compile.h"
#include "mruby_cef_v8.h"
#include "LaminaOptions.h"
#include "LaminaRenderProcessHandler.h"

LaminaRenderProcessHandler::LaminaRenderProcessHandler() {
   this->mrb = mrb_open();
}

void LaminaRenderProcessHandler::OnContextCreated(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) {

   FILE* extensions_script = fopen(LaminaOptions::script_on_v8_context_created.c_str(), "r");
   if (extensions_script != NULL) {
      mrb_load_file(this->mrb, extensions_script);
   }
   else {
      if (errno != ENOENT) {
         mrb_load_string(this->mrb, "Cef::V8.exec 'alert(\"Could not read lamina_extensions.rb\")'");
      }
   }
}