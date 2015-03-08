#ifndef LAMINA_OPTIONS_H
#define LAMINA_OPTIONS_H

#include "include\cef_browser.h"
#include <stdlib.h>
#include <list>

typedef std::list<CefRefPtr<CefBrowser>> BrowserList;

class LaminaOptions {
public:
   std::string appUrl = "";
   std::string subProcessName = "";
   std::string windowTitle = "";
   bool usePageTitles = true;
   std::string cachePath = "";
   int remoteDebuggingPort = 0;
   BrowserList browserList;

   static void load();
};

#endif /* LAMINA_OPTIONS_H */