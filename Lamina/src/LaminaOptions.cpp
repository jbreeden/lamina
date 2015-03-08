#define _CRT_SECURE_NO_WARNINGS

#include "mruby.h"
#include "mruby/string.h"
#include "mruby/variable.h"
#include "mruby/data.h"
#include "mruby/compile.h"
#include "stdio.h"
#include "LaminaOptions.h"

LaminaOptions laminaOptions;

#define SET_STRING_OPTION(field) \
   mrb_value param; \
   mrb_get_args(mrb, "S", &param); \
   field = mrb_str_to_cstr(mrb, param); \
   return self;

mrb_value lamina_set_url(mrb_state* mrb, mrb_value self) {
   SET_STRING_OPTION(laminaOptions.appUrl)
}

mrb_value lamina_set_sub_process(mrb_state* mrb, mrb_value self) {
   SET_STRING_OPTION(laminaOptions.subProcessName)
}

mrb_value lamina_set_window_title(mrb_state* mrb, mrb_value self) {
   SET_STRING_OPTION(laminaOptions.windowTitle)
}

mrb_value lamina_set_cache_path(mrb_state* mrb, mrb_value self) {
   SET_STRING_OPTION(laminaOptions.cachePath)
}

mrb_value lamina_set_remote_debugging_port(mrb_state* mrb, mrb_value self) {
   mrb_value param;
   mrb_get_args(mrb, "i", &param);
   laminaOptions.remoteDebuggingPort = param.value.i;
   return self;
}

mrb_value lamina_use_page_titles(mrb_state* mrb, mrb_value self) {
   mrb_value param;
   mrb_get_args(mrb, "o", &param);
   laminaOptions.usePageTitles = mrb_test(param);
   return self;
}

void LaminaOptions::load() {
   mrb_state* mrb = mrb_open();

   RClass* lamina_module = mrb_define_module(mrb, "Lamina");
   mrb_define_class_method(mrb, lamina_module, "set_url", lamina_set_url, MRB_ARGS_REQ(1));
   mrb_define_class_method(mrb, lamina_module, "set_sub_process", lamina_set_sub_process, MRB_ARGS_REQ(1));
   mrb_define_class_method(mrb, lamina_module, "set_window_title", lamina_set_window_title, MRB_ARGS_REQ(1));
   mrb_define_class_method(mrb, lamina_module, "set_cache_path", lamina_set_cache_path, MRB_ARGS_REQ(1));
   mrb_define_class_method(mrb, lamina_module, "set_remote_debugging_port", lamina_set_remote_debugging_port, MRB_ARGS_REQ(1));
   mrb_define_class_method(mrb, lamina_module, "use_page_titles", lamina_use_page_titles, MRB_ARGS_REQ(1));

   FILE* lamina_options_script = fopen("lamina_options.rb", "r");
   if (lamina_options_script != NULL) {
      mrb_load_file(mrb, lamina_options_script);
      fclose(lamina_options_script);
   }
   mrb_close(mrb);
}

#undef SET_STRING_OPTION