#define _CRT_SECURE_NO_DEPRECATE

#include "stdio.h"
#include "errno.h"
#include "mruby.h"
#include "mruby/compile.h"
#include "mruby_cef.h"
#include "ruby_fn_handler.h"
#include "LaminaOptions.h"
#include "LaminaRenderProcessHandler.h"

LaminaRenderProcessHandler::LaminaRenderProcessHandler() {
   // TODO: mrb_close
   this->mrb = mrb_open();
}

void LaminaRenderProcessHandler::OnContextCreated(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) {

   FILE* extensions_script = fopen(LaminaOptions::script_on_v8_context_created.c_str(), "r");
   if (extensions_script != NULL) {
      mrb_load_file(this->mrb, extensions_script);
   }
   else {
      if (errno != ENOENT) {
         CefRefPtr<CefV8Value> ret;
         CefRefPtr<CefV8Exception> exc;
         context->Eval("alert('Could not load on_v8_context_created.rb')", ret, exc);
      }
   }

   CefRefPtr<RubyFnHandler> rubyHandler = new RubyFnHandler(mrb);
   auto ruby_fn = CefV8Value::CreateFunction("ruby", rubyHandler);
   context->GetGlobal()->SetValue(CefString("ruby"), ruby_fn, CefV8Value::PropertyAttribute::V8_PROPERTY_ATTRIBUTE_NONE);
}