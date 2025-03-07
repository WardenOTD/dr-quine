#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
/*
	macros
*/
#define SRC "#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c#include <sys/stat.h>%c/*%c%cmacros%c*/%c#define SRC %c%s%c%c#define QUINE() int fd = open(%cGrace_kid.c%c, O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);dprintf(fd, SRC, 10, 10, 10, 10, 10, 9, 10, 10, 34, SRC, 34, 10, 34, 34, 10, 10, 10);close(fd)%c#define INC() int main(){QUINE();return 0;}%c%cINC();"
#define QUINE() int fd = open("Grace_kid.c", O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);dprintf(fd, SRC, 10, 10, 10, 10, 10, 9, 10, 10, 34, SRC, 34, 10, 34, 34, 10, 10, 10);close(fd)
#define INC() int main(){QUINE();return 0;}

INC();