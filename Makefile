COLLEENC	= cfile/Colleen.c
GRACEC		= cfile/Grace.c
SULLYC		= cfile/Sully.c

COLLEENS	= asmfile/Colleen.s
GRACES		= asmfile/Grace.s
SULLYS		= asmfile/Sully.s

SRC			= $(COLLEENC) $(GRACEC) $(SULLYC)
OBJ			= $(SRC:.c=.o)

ASMSRC		= $(COLLEENS) $(GRACES) $(SULLYS)
ASMOBJ		= $(ASMSRC:.s=.o)

EXENAMES	= $(addprefix testc/,\
				Colleen, Grace, Sully\
			), $(addprefix testasm/,\
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
			)

NAME		= dr-quine

NASM		= nasm -f elf64 -g
# LINK		= ld -m elf_x86_64

GCC			= gcc -Wall -Wextra -Werror

all: $(NAME)

%.o: %.s
	$(NASM) $< -o $@

%.o: %.c
	$(GCC) -c $< -o $@

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
	rm -rf $(OBJ) $(ASMOBJ) $(GENFILES)

fclean: clean
	rm -rf $(EXENAMES) testc testasm

re: fclean $(NAME)

.PHONY: clean fclean re testc testasm

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