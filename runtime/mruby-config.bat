@echo off

:top
shift
if "%0" equ "" goto :eof
if "%0" equ "--cflags" goto cflags
if "%0" equ "--ldflags" goto ldflags
if "%0" equ "--libs" goto libs
if "%0" equ "--help" goto showhelp
echo Invalid Option
goto :eof

:cflags
echo /c /nologo /W3 /we4013 /Zi /MD /O2 /D_CRT_SECURE_NO_WARNINGS /DEBUG /DMRB_STACK_EXTEND_DOUBLING /DMRB_ENABLE_CXX_EXCEPTION /DAPR_DECLARE_STATIC /DNN_NO_EXPORTS /I"C:\projects\lamina\dev\mruby-1.1.0\include" /I"C:\projects\lamina\dev\mrbgems\mruby-cef\include" /I"C:\projects\lamina\dev\mrbgems\mruby-cef\include\cef" /I"C:\projects\lamina\dev\mrbgems\mruby-apr\include\apr" /I"C:\projects\lamina\dev\mrbgems\mruby-apr\include\apr\win" /I"C:\projects\lamina\dev\mrbgems\mruby-nanomsg\include\nanomsg"
goto top

:libs
echo mruby.lib libcef_dll_wrapper_md.lib libcef.lib User32.lib apr-1_md.lib Advapi32.lib Shell32.lib nanomsg_md.lib Rpcrt4.lib Mswsock.lib Ws2_32.lib
goto top

:ldflags
echo /NOLOGO /DEBUG /INCREMENTAL:NO /OPT:ICF /OPT:REF /LIBPATH:"C:\projects\lamina\dev\mrbgems\mruby-cef\lib\win" /LIBPATH:"C:\projects\lamina\dev\mrbgems\mruby-apr\lib\win" /LIBPATH:"C:\projects\lamina\dev\mrbgems\mruby-nanomsg\lib\win" /LIBPATH:"C:\Windows\system" /LIBPATH:C:/projects/lamina/dev/mruby-1.1.0/build/host/lib
goto top

:showhelp
echo Usage: mruby-config [switches]
echo   switches:
echo   --cflags    print flags passed to compiler
echo   --ldflags   print flags passed to linker
echo   --libs      print linked libraries
