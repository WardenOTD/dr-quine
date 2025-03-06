# not final makefile, just for testing

cpp:
	g++ -Wall -Wextra -Werror quine.cpp -o cppquine
	./cppquine > cpq.cpp
	g++ -Wall -Wextra -Werror cpq.cpp -o cpq
	./cpq > cppq.cpp
	g++ -Wall -Wextra -Werror cppq.cpp -o cppq

outcpp:
	echo "\n\033[32mcppquine\033[0m" && ./cppquine && echo "\n\n\033[32mcpq\033[0m" && ./cpq && echo "\n\n\033[32mcppq\033[0m" && ./cppq && echo "\n"
	diff quine.cpp cpq.cpp
	diff quine.cpp cppq.cpp
	diff cpq.cpp cppq.cpp

c:
	gcc -Wall -Wextra -Werror Colleen.c -o Colleen
	./Colleen > tmp.c
	gcc -Wall -Wextra -Werror tmp.c -o tmp
	./tmp > tmp2.c
	gcc -Wall -Wextra -Werror tmp2.c -o tmp2

outc:
	echo "\n\033[32mColleen\033[0m" && ./Colleen && echo "\n\n\033[32mtmp\033[0m" && ./tmp && echo "\n\n\033[32mtmp2\033[0m" && ./tmp2 && echo "\n"
	diff Colleen.c tmp.c
	diff Colleen.c tmp2.c
	diff tmp.c tmp2.c

grace:
	g++ -Wall -Wextra -Werror Grace.c -o Grace
	echo "\n\033[32mGrace\033[0m" && ./Grace
	diff Grace.c Grace_kid.c

clean:
	rm -f Colleen tmp tmp.c tmp2 tmp2.c cppquine cpq cpq.cpp cppq cppq.cpp Grace Grace_kid.c