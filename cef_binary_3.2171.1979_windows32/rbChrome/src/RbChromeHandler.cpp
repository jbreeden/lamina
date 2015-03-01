#include "RbChromeHandler.h"
#include "include/cef_app.h"
#include "include/wrapper/cef_helpers.h"
#include "include/base/cef_bind.h"
#include "include/wrapper/cef_closure_task.h"
#include "include/wrapper/cef_helpers.h"
#include "FFIBridge.h"
#include <regex>
#include <fstream>

using namespace std;

extern FFIBridge ffiBridge;

namespace {

   RbChromeHandler* g_instance = NULL;

}  // namespace

RbChromeHandler::RbChromeHandler()
   : is_closing_(false) {
   DCHECK(!g_instance);
   g_instance = this;
}

RbChromeHandler::~RbChromeHandler() {
   g_instance = NULL;
}

// static
RbChromeHandler* RbChromeHandler::GetInstance() {
   return g_instance;
}

void RbChromeHandler::OnAfterCreated(CefRefPtr<CefBrowser> browser) {
   CEF_REQUIRE_UI_THREAD();

   // Set the frame window title bar
   CefWindowHandle hwnd = browser->GetHost()->GetWindowHandle();
   SetWindowText(hwnd, ffiBridge.windowTitle.c_str());

   // Add to the list of existing browsers.
   browser_list_.push_back(browser);
}

bool RbChromeHandler::DoClose(CefRefPtr<CefBrowser> browser) {
   CEF_REQUIRE_UI_THREAD();

   // Closing the main window requires special handling. See the DoClose()
   // documentation in the CEF header for a detailed destription of this
   // process.
   if (browser_list_.size() == 1) {
      // Set a flag to indicate that the window close should be allowed.
      is_closing_ = true;
   }

   // Allow the close. For windowed browsers this will result in the OS close
   // event being sent.
   return false;
}

void RbChromeHandler::OnBeforeClose(CefRefPtr<CefBrowser> browser) {
   CEF_REQUIRE_UI_THREAD();

   // Remove from the list of existing browsers.
   BrowserList::iterator bit = browser_list_.begin();
   for (; bit != browser_list_.end(); ++bit) {
      if ((*bit)->IsSame(browser)) {
         browser_list_.erase(bit);
         break;
      }
   }

   if (browser_list_.empty()) {
      // All browser windows have closed. Quit the application message loop.
      CefQuitMessageLoop();
   }
}

void RbChromeHandler::OnLoadError(CefRefPtr<CefBrowser> browser,
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

void RbChromeHandler::CloseAllBrowsers(bool force_close) {
   if (!CefCurrentlyOn(TID_UI)) {
      // Execute on the UI thread.
      CefPostTask(TID_UI,
         base::Bind(&RbChromeHandler::CloseAllBrowsers, this, force_close));
      return;
   }

   if (browser_list_.empty())
      return;

   BrowserList::const_iterator it = browser_list_.begin();
   for (; it != browser_list_.end(); ++it)
      (*it)->GetHost()->CloseBrowser(force_close);
}

void RbChromeHandler::ExecuteJavaScript(char* script, char* window_pattern, bool firstMatch) {
   auto browsers = this->browser_list_;
   regex regexp(window_pattern);
   for (auto browserPtr = browsers.begin(); browserPtr != browsers.end(); ++browserPtr) {
      auto browser = *browserPtr;
      vector<CefString> frameNames;
      browser->GetFrameNames(frameNames);
      for (auto frameNamePtr = frameNames.begin(); frameNamePtr != frameNames.end(); ++frameNamePtr){
         auto name = *frameNamePtr;
         if (regex_match(name.ToString(), regexp)) {
            auto frame = browser->GetFrame(name);
            frame->ExecuteJavaScript(script, frame->GetURL(), 0);
            if (firstMatch) {
               return;
            }
         }
      }
   }
}