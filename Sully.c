#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

#define FILENUM (__FILE__[strlen(__FILE__) - 3] == 'y') ? 4 : (__FILE__[strlen(__FILE__) - 3] - 49)

int main(){
	int i = 5;
	if (--i < 0)
		return 0;
	int len = snprintf(NULL, 0, "Sully_%d.c", i);
	char filename[len + 1];
	snprintf(filename, len + 1, "Sully_%d.c", i);
	int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);
	char* str = "#include <stdio.h>%c#include <fcntl.h>%c#include <unistd.h>%c#include <string.h>%c#include <stdlib.h>%c%c#define FILENUM (__FILE__[strlen(__FILE__) - 3] == 'y') ? 4 : (__FILE__[strlen(__FILE__) - 3] - 49)%c%cint main(){%c%cint i = %d;%c%cif (--i < 0)%c%c%creturn 0;%c%cint len = snprintf(NULL, 0, %cSully_%cd.c%c, i);%c%cchar filename[len + 1];%c%csnprintf(filename, len + 1, %cSully_%cd.c%c, i);%c%c";
	char* str2 = "int fd = open(filename, O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);%c%cchar* str = %c%s%c;%c%cchar* str2 = %c%s%c;%c%cchar* str3 = %c%s%c;%c%c";
	char* str3 = "char q = 34;%c%cchar t = 9;%c%cchar n = 10;%c%cchar p = 37;%c%cdprintf(fd, str, n, n, n, n, n, n, n, n, n, t, FILENUM, n, t, n, t, t, n, t, q, p, q, n, t, n, t, q, p, q, n, t);%c%cdprintf(fd, str2, n, t, q, str, q, n, t, q, str2, q, n, t, q, str3, q, n, t);%c%cdprintf(fd, str3, n, t, n, t, n, t, n, t, n, t, n, t, n, t);%c%c";
	char q = 34;
	char t = 9;
	char n = 10;
	char p = 37;
	dprintf(fd, str, n, n, n, n, n, n, n, n, n, t, FILENUM, n, t, n, t, t, n, t, q, p, q, n, t, n, t, q, p, q, n, t);
	dprintf(fd, str2, n, t, q, str, q, n, t, q, str2, q, n, t, q, str3, q, n, t);
	dprintf(fd, str3, n, t, n, t, n, t, n, t, n, t, n, t, n, t);
	char* str4 = "char* str4 = %c%s%c;%c%cdprintf(fd, str4, q, str4, q, n, t, n, t, n, t, q, p, p, q, n, t, n, t, q, p, p, q, n, t, n, t, q, p, q, n, t, n, t, q, p, q, n, t, n, t, n);%c%cclose(fd);%c%cint lengcc = snprintf(NULL, 0, %cgcc -Wall -Wextra -Werror %cs -o Sully_%cd%c, filename, i);%c%cchar gcc[lengcc + 1];%c%csnprintf(gcc, lengcc + 1, %cgcc -Wall -Wextra -Werror %cs -o Sully_%cd%c, filename, i);%c%csystem(gcc);%c%cint lenc = snprintf(NULL, 0, %c./Sully_%cd%c, i);%c%cchar c[lenc + 1];%c%csnprintf(c, lenc + 1, %c./Sully_%cd%c, i);%c%csystem(c);%c%creturn 0;%c}";
	dprintf(fd, str4, q, str4, q, n, t, n, t, n, t, q, p, p, q, n, t, n, t, q, p, p, q, n, t, n, t, q, p, q, n, t, n, t, q, p, q, n, t, n, t, n);
	close(fd);
	int lengcc = snprintf(NULL, 0, "gcc -Wall -Wextra -Werror %s -o Sully_%d", filename, i);
	char gcc[lengcc + 1];
	snprintf(gcc, lengcc + 1, "gcc -Wall -Wextra -Werror %s -o Sully_%d", filename, i);
	system(gcc);
	int lenc = snprintf(NULL, 0, "./Sully_%d", i);
	char c[lenc + 1];
	snprintf(c, lenc + 1, "./Sully_%d", i);
	system(c);
	return 0;
}