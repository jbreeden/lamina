#include "mruby_lamina.h"

extern int global_argc;
extern char** global_argv;

int main(int argc, char** argv) {
  global_argc = argc;
  global_argv = argv;
  return lamina_main();
}
