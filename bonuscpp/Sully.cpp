#include <fstream>
#include <iostream>
#include <string>

using namespace std;

#define SRC R"(#include <fstream>
#include <iostream>
#include <string>

using namespace std;

#define SRC R%1$c(%2$s)%1$c

#define NAME %1$cSully_%%d.cpp%1$c
#define GPP %1$cg++ -Wall -Wextra -Werror %%s -o Sully_%%d%1$c
#define EXEC %1$c./Sully_%%d%1$c
char *create_file(int i){
	ofstream fd;
	char *filename = (char *)calloc(15, sizeof(char));
	sprintf(filename, NAME, i);
	fd.open(filename, ios::trunc);
	char src[10000];
	sprintf(src, SRC, 34, SRC, i);
	fd << src;
	fd.close();
	return filename;
}
void execute_file(char *filename, int i){
	char gpp[100];
	sprintf(gpp, GPP, filename, i);
	char exec[15];
	sprintf(exec, EXEC, i);
	system(gpp);
	system(exec);
	free(filename);
}
int main(){
	int i = %3$d;
	if (--i < 0)
		return 0;
	execute_file(create_file(i), i);
	return 0;
})"

#define NAME "Sully_%d.cpp"
#define GPP "g++ -Wall -Wextra -Werror %s -o Sully_%d"
#define EXEC "./Sully_%d"
char *create_file(int i){
	ofstream fd;
	char *filename = (char *)calloc(15, sizeof(char));
	sprintf(filename, NAME, i);
	fd.open(filename, ios::trunc);
	char src[10000];
	sprintf(src, SRC, 34, SRC, i);
	fd << src;
	fd.close();
	return filename;
}
void execute_file(char *filename, int i){
	char gpp[100];
	sprintf(gpp, GPP, filename, i);
	char exec[15];
	sprintf(exec, EXEC, i);
	system(gpp);
	system(exec);
	free(filename);
}
int main(){
	int i = 5;
	if (--i < 0)
		return 0;
	execute_file(create_file(i), i);
	return 0;
}