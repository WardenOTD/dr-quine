#include <iostream>
#include <string>
using namespace std;
/*
	Outside Comment
*/
void func(char nl, char quo, char tab){
	string src = "#include <iostream>%1$c#include <string>%1$cusing namespace std;%1$c/*%1$c%2$cOutside Comment%1$c*/%1$cvoid func(char nl, char quo, char tab){%1$c%2$cstring src = %3$c%4$s%3$c;%1$c%2$cconst char* csrc = src.string::c_str();%1$c%2$cprintf(csrc, nl, tab, quo, csrc);%1$c}%1$cint main(){%1$c%2$c/*%1$c%2$c%2$cInside Comment%1$c%2$c*/%1$c%2$cfunc(10, 34, 9);%1$c%2$creturn 0;%1$c}";
	const char* csrc = src.string::c_str();
	printf(csrc, nl, tab, quo, csrc);
}
int main(){
	/*
		Inside Comment
	*/
	func(10, 34, 9);
	return 0;
}