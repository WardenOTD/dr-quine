section .note.GNU-stack

extern fopen
extern fclose
extern fprintf
extern sprintf
extern system

section .rodata
MODE: db "w+", 0
format_NAME: db "Sully_%d", 0
format_filename: db "%s.s", 0
format_gcc: db "nasm -f elf64 -g %1$s.s && gcc -Wall -Wextra -Werror %1$s.o -o %1$s", 0
format_exec: db "./%s", 0
i: equ 5
string: db "section .note.GNU-stack%1$c%1$cextern fopen%1$cextern fclose%1$cextern fprintf%1$cextern sprintf%1$cextern system%1$c%1$csection .rodata%1$cMODE: db %2$cw+%2$c, 0%1$cformat_NAME: db %2$cSully_%%d%2$c, 0%1$cformat_filename: db %2$c%%s.s%2$c, 0%1$cformat_gcc: db %2$cnasm -f elf64 -g %%1$s.s && gcc -Wall -Wextra -Werror %%1$s.o -o %%1$s%2$c, 0%1$cformat_exec: db %2$c./%%s%2$c, 0%1$ci: equ %4$d%1$cstring: db %2$c%3$s%2$c, 0%1$c%1$csection .data%1$cNAME: times 100 db 0%1$cfilename: times 100 db 0%1$cgcc: times 500 db 0%1$cexec: times 100 db 0%1$c%1$csection .text%1$cglobal main%1$c%1$cmain:%1$center 0, 0%1$csub rsp, 16%1$cpush r12%1$cpush r13%1$cmov r12, i%1$cdec r12%1$ccmp r12, 0%1$cjl _end%1$c%1$cxor rax, rax%1$clea rdi, [rel NAME]%1$clea rsi, [rel format_NAME]%1$cmov rdx, r12%1$ccall sprintf wrt ..plt%1$c%1$cxor rax, rax%1$clea rdi, [rel filename]%1$clea rsi, [rel format_filename]%1$clea rdx, [rel NAME]%1$ccall sprintf wrt ..plt%1$c%1$cxor rax, rax%1$clea rdi, [rel filename]%1$clea rsi, [rel MODE]%1$ccall fopen wrt ..plt%1$cmov r13, rax%1$c%1$cdebug:%1$cmov rdi, rax%1$clea rsi, [rel string]%1$cmov rdx, 0x0A%1$cmov rcx, 0x22%1$clea r8, [rel string]%1$cmov r9, r12%1$cxor rax, rax%1$ccall fprintf wrt ..plt%1$c%1$cxor rax, rax%1$cmov rdi, r13%1$ccall fclose wrt ..plt%1$c%1$cxor rax, rax%1$clea rdi, [rel gcc]%1$clea rsi, [rel format_gcc]%1$clea rdx, [rel NAME]%1$ccall sprintf wrt ..plt%1$clea rdi, [rel gcc]%1$ccall system wrt ..plt%1$c%1$cxor rax, rax%1$clea rdi, [rel exec]%1$clea rsi, [rel format_exec]%1$clea rdx, [rel NAME]%1$ccall sprintf wrt ..plt%1$clea rdi, [rel exec]%1$ccall system wrt ..plt%1$c%1$c_end:%1$cxor rax, rax%1$cpop r13%1$cpop r12%1$cadd rsp, 16%1$cleave%1$cret", 0

section .data
NAME: times 100 db 0
filename: times 100 db 0
gcc: times 500 db 0
exec: times 100 db 0

section .text
global main

main:
enter 0, 0
sub rsp, 16
push r12
push r13
mov r12, i
dec r12
cmp r12, 0
jl _end

xor rax, rax
lea rdi, [rel NAME]
lea rsi, [rel format_NAME]
mov rdx, r12
call sprintf wrt ..plt

xor rax, rax
lea rdi, [rel filename]
lea rsi, [rel format_filename]
lea rdx, [rel NAME]
call sprintf wrt ..plt

xor rax, rax
lea rdi, [rel filename]
lea rsi, [rel MODE]
call fopen wrt ..plt
mov r13, rax

debug:
mov rdi, rax
lea rsi, [rel string]
mov rdx, 0x0A
mov rcx, 0x22
lea r8, [rel string]
mov r9, r12
xor rax, rax
call fprintf wrt ..plt

xor rax, rax
mov rdi, r13
call fclose wrt ..plt

xor rax, rax
lea rdi, [rel gcc]
lea rsi, [rel format_gcc]
lea rdx, [rel NAME]
call sprintf wrt ..plt
lea rdi, [rel gcc]
call system wrt ..plt

xor rax, rax
lea rdi, [rel exec]
lea rsi, [rel format_exec]
lea rdx, [rel NAME]
call sprintf wrt ..plt
lea rdi, [rel exec]
call system wrt ..plt

_end:
xor rax, rax
pop r13
pop r12
add rsp, 16
leave
ret