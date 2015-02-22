#ifndef RBCHROME_H
#define RBCHROME_H

#ifdef _WIN32
   #define CEF_USE_SANDBOX
   #ifdef BUILDING_RB_CHROME_DLL
      #define EXPORT __declspec(dllexport)
   #else
      #define EXPORT __declspec(dllimport)
   #endif
#else
   #define EXPORT
#endif

#if __cplusplus
extern "C" {
#endif

   EXPORT void rb_chrome_set_url(char* url);
   EXPORT void rb_chrome_set_sub_process(char* sub_process_name);
   EXPORT int rb_chrome_start();

#if __cplusplus
}
#endif

#endif /* RBCHROME_H */