#include <iostream>
#include <string>

using namespace std;

int main(int argc, char** argv) {
   string command = "rb-chrome.rb ";
   for (int i = 1; i < argc; ++i) {
      command += string(argv[i]) + " ";
   }

#ifdef DEBUG
   cout << "SUBPROCESS COMMAND: " << command << endl;
#endif

   system(command.c_str());
}