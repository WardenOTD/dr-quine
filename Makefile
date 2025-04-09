COLLEENC	= cfile/Colleen.c
GRACEC		= cfile/Grace.c
SULLYC		= cfile/Sully.c

COLLEENS	= asmfile/Colleen.s
GRACES		= asmfile/Grace.s
SULLYS		= asmfile/Sully.s

COLLEENPY	= bonus/Colleen.py
GRACEPY		= bonus/Grace.py
SULLYPY		= bonus/Sully.py

COLLEENCPP	= bonuscpp/Colleen.cpp
GRACECPP	= bonuscpp/Grace.cpp
SULLYCPP	= bonuscpp/Sully.cpp

SRC			= $(COLLEENC) $(GRACEC) $(SULLYC)
OBJ			= $(SRC:.c=.o)

ASMSRC		= $(COLLEENS) $(GRACES) $(SULLYS)
ASMOBJ		= $(ASMSRC:.s=.o)

BONUSSRC	= $(COLLEENPY) $(GRACEPY) $(SULLYPY)

BONUSCPPSRC	= $(COLLEENCPP) $(GRACECPP) $(SULLYCPP)
BONUSCPPOBJ	= $(BONUSCPPSRC:.cpp=.o)

EXENAMES	= $(addprefix testc/,\
				Colleen, Grace, Sully\
			), $(addprefix testasm/,\
				Colleen, Grace, Sully\
			), $(addprefix testcpp/,\
				Colleen, Grace, Sully\
			)

GENFILES	= $(addprefix testc/,\
				tmp.txt\
				Grace_kid.c\
				Sully_4 Sully_4.c\
				Sully_3 Sully_3.c\
				Sully_2 Sully_2.c\
				Sully_1 Sully_1.c\
				Sully_0 Sully_0.c\
				Sully_-1 Sully_-1.c\
			), $(addprefix testasm/,\
				tmp.txt\
				Grace_kid.s\
				Sully_4 Sully_4.s\
				Sully_3 Sully_3.s\
				Sully_2 Sully_2.s\
				Sully_1 Sully_1.s\
				Sully_0 Sully_0.s\
				Sully_-1 Sully_-1.s\
			), $(addprefix testbonus/,\
				tmp.txt\
				Grace_kid.py\
				Sully_4.py\
				Sully_3.py\
				Sully_2.py\
				Sully_1.py\
				Sully_0.py\
				Sully_-1.py\
			), $(addprefix testcpp/,\
				tmp.txt\
				Grace_kid.cpp\
				Sully_4 Sully_4.cpp\
				Sully_3 Sully_3.cpp\
				Sully_2 Sully_2.cpp\
				Sully_1 Sully_1.cpp\
				Sully_0 Sully_0.cpp\
				Sully_-1 Sully_-1.cpp\
			)

NAME		= dr-quine

NASM		= nasm -f elf64 -g
# LINK		= ld -m elf_x86_64

GCC			= gcc -Wall -Wextra -Werror

PY			= python3

GPP			= g++ -Wall -Wextra -Werror

all: $(NAME)

%.o: %.s
	$(NASM) $< -o $@

%.o: %.c
	$(GCC) -c $< -o $@

%.o: %.cpp
	$(GPP) -c $< -o $@

bonus: bonuscpp
	mkdir -p testbonus

testcpp/Colleen: $(COLLEENCPP:.cpp=.o)
	mkdir -p testcpp
	$(GPP) $< -o $@

testcpp/Grace: $(GRACECPP:.cpp=.o)
	mkdir -p testcpp
	$(GPP) $< -o $@

testcpp/Sully: $(SULLYCPP:.cpp=.o)
	mkdir -p testcpp
	$(GPP) $< -o $@

bonuscpp: testcpp/Colleen testcpp/Grace testcpp/Sully

testasm/Colleen: $(COLLEENS:.s=.o)
	mkdir -p testasm
	$(GCC) $< -o $@

testasm/Grace: $(GRACES:.s=.o)
	mkdir -p testasm
	$(GCC) $< -o $@

testasm/Sully: $(SULLYS:.s=.o)
	mkdir -p testasm
	$(GCC) $< -o $@

compile: testasm/Colleen testasm/Grace testasm/Sully

testc/Colleen: $(COLLEENC:.c=.o)
	mkdir -p testc
	$(GCC) $< -o $@

testc/Grace: $(GRACEC:.c=.o)
	mkdir -p testc
	$(GCC) $< -o $@

testc/Sully: $(SULLYC:.c=.o)
	mkdir -p testc
	$(GCC) $< -o $@

$(NAME): testc/Colleen testc/Grace testc/Sully compile

clean:
	@ rm -rf $(OBJ) $(ASMOBJ) $(BONUSCPPOBJ) $(GENFILES)
	@if [ "$(MAKECMDGOALS)" = "clean" ]; then\
		echo "\033[0;31mrm all except exec files and directory\033[0m";\
	fi
	

fclean: clean
	@ rm -rf $(EXENAMES) testc testasm testbonus testcpp
	@ echo "\033[0;31mrm all\033[0m"

re: fclean $(NAME) bonus

.PHONY: clean fclean re testc testasm testbonus bonus testcpp

testc:
	@ echo "\n\033[32mColleen\033[0m"
	@ echo "./Colleen > tmp.txt"
	@ cd testc && ./Colleen > tmp.txt
	diff cfile/Colleen.c testc/tmp.txt
	@ echo "\n\033[32mGrace\033[0m"
	@ echo "./Grace"
	@ cd testc && ./Grace
	diff cfile/Grace.c testc/Grace_kid.c
	@ echo "\n\033[32mSully\033[0m"
	@ echo "./Sully"
	@ cd testc && ./Sully
	diff cfile/Sully.c testc/Sully_4.c; [ $$? -eq 1 ]
	diff testc/Sully_4.c testc/Sully_3.c; [ $$? -eq 1 ]
	diff testc/Sully_3.c testc/Sully_2.c; [ $$? -eq 1 ]
	diff testc/Sully_2.c testc/Sully_1.c; [ $$? -eq 1 ]
	diff testc/Sully_1.c testc/Sully_0.c; [ $$? -eq 1 ]
	- diff testc/Sully_0.c testc/Sully_-1.c; [ $$? -eq 1 ]

testasm:
	@ echo "\n\033[32mColleen\033[0m"
	@ echo "./Colleen > tmp.txt"
	@ cd testasm && ./Colleen > tmp.txt
	diff asmfile/Colleen.s testasm/tmp.txt
	@ echo "\n\033[32mGrace\033[0m"
	@ echo "./Grace"
	@ cd testasm && ./Grace
	diff asmfile/Grace.s testasm/Grace_kid.s
	@ echo "\n\033[32mSully\033[0m"
	@ echo "./Sully"
	@ cd testasm && ./Sully
	diff asmfile/Sully.s testasm/Sully_4.s; [ $$? -eq 1 ]
	diff testasm/Sully_4.s testasm/Sully_3.s; [ $$? -eq 1 ]
	diff testasm/Sully_3.s testasm/Sully_2.s; [ $$? -eq 1 ]
	diff testasm/Sully_2.s testasm/Sully_1.s; [ $$? -eq 1 ]
	diff testasm/Sully_1.s testasm/Sully_0.s; [ $$? -eq 1 ]
	- diff testasm/Sully_0.s testasm/Sully_-1.s; [ $$? -eq 1 ]

testbonus:
	@ echo "\n\033[32mColleen\033[0m"
	@ echo "$(PY) Colleen.py > tmp.txt"
	@ cd testbonus && $(PY) ../bonus/Colleen.py > tmp.txt
	diff $(COLLEENPY) testbonus/tmp.txt
	@ echo "\n\033[32mGrace\033[0m"
	@ echo "$(PY) Grace.py"
	@ cd testbonus && $(PY) ../bonus/Grace.py
	diff $(GRACEPY) testbonus/Grace_kid.py
	@ echo "\n\033[32mSully\033[0m"
	@ echo "$(PY) Sully.py"
	@ cd testbonus && $(PY) ../bonus/Sully.py
	diff $(SULLYPY) testbonus/Sully_4.py; [ $$? -eq 1 ]
	diff testbonus/Sully_4.py testbonus/Sully_3.py; [ $$? -eq 1 ]
	diff testbonus/Sully_3.py testbonus/Sully_2.py; [ $$? -eq 1 ]
	diff testbonus/Sully_2.py testbonus/Sully_1.py; [ $$? -eq 1 ]
	diff testbonus/Sully_1.py testbonus/Sully_0.py; [ $$? -eq 1 ]
	- diff testbonus/Sully_0.py testbonus/Sully_-1.py; [ $$? -eq 1 ]

testcpp:
	@ echo "\n\033[32mColleen\033[0m"
	@ echo "./Colleen > tmp.txt"
	@ cd testcpp && ./Colleen > tmp.txt
	diff bonuscpp/Colleen.cpp testcpp/tmp.txt
	@ echo "\n\033[32mGrace\033[0m"
	@ echo "./Grace"
	@ cd testcpp && ./Grace
	diff bonuscpp/Grace.cpp testcpp/Grace_kid.cpp
	@ echo "\n\033[32mSully\033[0m"
	@ echo "./Sully"
	@ cd testcpp && ./Sully
	diff bonuscpp/Sully.cpp testcpp/Sully_4.cpp; [ $$? -eq 1 ]
	diff testcpp/Sully_4.cpp testcpp/Sully_3.cpp; [ $$? -eq 1 ]
	diff testcpp/Sully_3.cpp testcpp/Sully_2.cpp; [ $$? -eq 1 ]
	diff testcpp/Sully_2.cpp testcpp/Sully_1.cpp; [ $$? -eq 1 ]
	diff testcpp/Sully_1.cpp testcpp/Sully_0.cpp; [ $$? -eq 1 ]
	- diff testcpp/Sully_0.cpp testcpp/Sully_-1.cpp; [ $$? -eq 1 ]