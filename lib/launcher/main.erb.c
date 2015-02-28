#include <cstdlib>
#include <cstdio>
#include <string>
#include <Windows.h>

using namespace std;

int WinMain(
   HINSTANCE hInstance,
   HINSTANCE hPrevInstance,
   LPSTR lpCmdLine,
   int nShowCmd)
{
  LPSTR app = "<%= command %>";
  STARTUPINFO si;

  ZeroMemory(&si, sizeof(si));
  si.cb = sizeof(si);

  PROCESS_INFORMATION pi;
  ZeroMemory(&pi, sizeof(pi));

  printf("Creating Process.\\n" );

  // Start the child process.
  if (!CreateProcess(NULL,   // No module name (use command line)
    app,        // Command line
    NULL,       // Process handle not inheritable
    NULL,       // Thread handle not inheritable
    FALSE,      // Set handle inheritance to FALSE
    0,          // No creation flags
    NULL,       // Use parent's environment block
    NULL,       // Use parent's starting directory
    &si,        // Pointer to STARTUPINFO structure
    &pi)        // Pointer to PROCESS_INFORMATION structure
    )
  {
    printf("CreateProcess failed (%d).\\n", GetLastError());
    return 1;
  }
  printf("CreateProcess Succeeded.\\n");
  return 0;
}
