#include <iostream>
#include <string>
using namespace std;
int main() {
	char q = 34;
	string s = "#include <iostream>%c#include <string>%c";
	const char* str = s.string::c_str();
	string st = "using namespace std;%cint main() {%c%cchar q = 34;%c%cstring s = %c%s%c;%c%cconst char* str = s.string::c_str();%c%cstring st = %c%s%c;%c%cconst char* fullstring = st.string::c_str();%c%cprintf(str, 10, 10);%c%cprintf(fullstring, 10, 10, 9, 10, 9, q, str, q, 10, 9, 10, 9, q, fullstring, q, 10, 9, 10, 9, 10, 9, 10, 9, 10);%c%creturn 0;%c}";
	const char* fullstring = st.string::c_str();
	printf(str, 10, 10);
	printf(fullstring, 10, 10, 9, 10, 9, q, str, q, 10, 9, 10, 9, q, fullstring, q, 10, 9, 10, 9, 10, 9, 10, 9, 10);
	return 0;
}