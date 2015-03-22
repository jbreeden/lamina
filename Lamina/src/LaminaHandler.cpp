#include "LaminaHandler.h"
#include "include/wrapper/cef_helpers.h"

using namespace std;

namespace {
   LaminaHandler* g_instance = NULL;
}  // namespace

LaminaHandler::LaminaHandler() {
   DCHECK(!g_instance);
   g_instance = this;
}

LaminaHandler::~LaminaHandler() {
   g_instance = NULL;
}

// static
LaminaHandler* LaminaHandler::GetInstance() {
   return g_instance;
}

void LaminaHandler::OnLoadError(CefRefPtr<CefBrowser> browser,
   CefRefPtr<CefFrame> frame,
   ErrorCode errorCode,
   const CefString& errorText,
   const CefString& failedUrl) {
   CEF_REQUIRE_UI_THREAD();

   // Don't display an error for downloaded files.
   if (errorCode == ERR_ABORTED)
      return;

   // Display a load error message.
   std::stringstream ss;
   ss << "<html><body bgcolor=\"white\">"
      "<h2>Failed to load URL " << std::string(failedUrl) <<
      " with error " << std::string(errorText) << " (" << errorCode <<
      ").</h2></body></html>";
   frame->LoadString(ss.str(), failedUrl);
}
