#include <stdio.h>
/*
	This is a comment.
*/
void func(char q, char t){
	char* str = "#include <stdio.h>%c";
	char* str2 = "/*%c%cThis is a comment.%c*/%cvoid func(char q, char t){%c%cchar* str = %c%s%c;%c%cchar* str2 = %c%s%c;%c%cprintf(str, 10);%c%cprintf(str2, 10, t, 10, 10, 10, t, q, str, q, 10, t, q, str2, q, 10, t, 10, t, 10, 10, 10, t, 10, t, t, 10, t, 10, t, 10, t, 10, t, 10, t, 10, t, 10);%c}%cint main(){%c%c/*%c%c%cq = double quote%c%c*/%c%cchar q = 34;%c%cchar t = 9;%c%cfunc(q, t);%c%creturn 0;%c}";
	printf(str, 10);
	printf(str2, 10, t, 10, 10, 10, t, q, str, q, 10, t, q, str2, q, 10, t, 10, t, 10, 10, 10, t, 10, t, t, 10, t, 10, t, 10, t, 10, t, 10, t, 10, t, 10);
}
int main(){
	/*
		q = double quote
	*/
	char q = 34;
	char t = 9;
	func(q, t);
	return 0;
}