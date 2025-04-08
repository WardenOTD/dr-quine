#include <fstream>
#include <iostream>
#include <string>

using namespace std;
/*
	macros
*/
#define SRC "#include <fstream>%1$c#include <iostream>%1$c#include <string>%1$c%1$cusing namespace std;%1$c/*%1$c%2$cmacros%1$c*/%1$c#define SRC %3$c%4$s%3$c%1$c#define QUINE() ofstream fd;fd.open(%3$cGrace_kid.cpp%3$c, ios::trunc);char src[10000];sprintf(src, SRC, 10, 9, 34, SRC);fd << src;fd.close()%1$c#define PAIN() int main(){QUINE();return 0;}%1$c%1$cPAIN();"
#define QUINE() ofstream fd;fd.open("Grace_kid.cpp", ios::trunc);char src[10000];sprintf(src, SRC, 10, 9, 34, SRC);fd << src;fd.close()
#define PAIN() int main(){QUINE();return 0;}

PAIN();