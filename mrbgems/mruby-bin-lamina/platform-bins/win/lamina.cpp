#include "Windows.h"
#include "mruby_lamina.h"

#define LAMINA_LOG(msg) \
   /* do nothing for laminaw */

HINSTANCE app_handle;

int APIENTRY WinMain(HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR    lpCmdLine,
   int       nCmdShow)
{
   app_handle = hInstance;
   return lamina_main();
}
