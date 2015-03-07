#ifndef FFIBRIDGE_H
#define FFIBRIDGE_H

#include "include\cef_browser.h"
#include <stdlib.h>
#include <list>

typedef std::list<CefRefPtr<CefBrowser>> BrowserList;

class FFIBridge {
public:
   std::string appUrl = "";
   std::string subProcessName = "";
   std::string windowTitle = "";
   bool usePageTitles = true;
   std::string cachePath = "";
   int remoteDebuggingPort = 0;
   BrowserList browserList;
};

#endif /* FFIBRIDGE_H */