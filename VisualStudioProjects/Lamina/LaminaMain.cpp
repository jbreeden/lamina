// Lamina.cpp : Defines the entry point for the application.
//

#include "Windows.h"
#include "LaminaMain.h"
#include "lamina.h"

int APIENTRY WinMain(HINSTANCE hInstance,
            HINSTANCE hPrevInstance,
            LPSTR    lpCmdLine,
            int       nCmdShow)
{
   return lamina_start(__argc, __argv);
}
