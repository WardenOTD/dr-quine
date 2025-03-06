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
	gcc -Wall -Wextra -Werror Grace.c -o Grace
	echo "\n\033[32mGrace\033[0m" && ./Grace
	diff Grace.c Grace_kid.c

sully:
	gcc -Wall -Wextra -Werror Sully.c -o Sully
	./Sully
	gcc -Wall -Wextra -Werror Sully_4.c -o Sully_4
	./Sully_4
	gcc -Wall -Wextra -Werror Sully_3.c -o Sully_3
	./Sully_3
	gcc -Wall -Wextra -Werror Sully_2.c -o Sully_2
	./Sully_2
	gcc -Wall -Wextra -Werror Sully_1.c -o Sully_1
	./Sully_1
	gcc -Wall -Wextra -Werror Sully_0.c -o Sully_0
	./Sully_0
	@ echo ""
	- gcc -Wall -Wextra -Werror Sully_-1.c -o Sully_-1
	- ./Sully_-1
	@ echo ""
	@echo "\n\033[32mSully\033[0m"
	diff Sully.c Sully_4.c; [ $$? -eq 1 ]
	diff Sully_4.c Sully_3.c; [ $$? -eq 1 ]
	diff Sully_3.c Sully_2.c; [ $$? -eq 1 ]
	diff Sully_2.c Sully_1.c; [ $$? -eq 1 ]
	diff Sully_1.c Sully_0.c; [ $$? -eq 1 ]
	- diff Sully_0.c Sully_-1.c; [ $$? -eq 1 ]

clean:
	rm -f Colleen tmp tmp.c tmp2 tmp2.c cppquine cpq cpq.cpp cppq cppq.cpp
	rm -f Grace Grace_kid.c
	rm -f Sully Sully_4 Sully_3 Sully_2 Sully_1 Sully_0 Sully_-1 Sully_4.c Sully_3.c Sully_2.c Sully_1.c Sully_0.c Sully_-1.c