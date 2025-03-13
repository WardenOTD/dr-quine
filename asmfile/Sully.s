section .note.GNU-stack

extern dprintf
extern sprintf
extern system

%define O_RDRW_O_CREAT_O_TRUNC (00000002o | 00000100o | 00001000o)
%define S_IRWXU 700o

%macro findFileNum 0
lea rdi, [rel cur_file]
call strlen
mov rcx, rax
sub rcx, 3
lea rdi, [rel cur_file]
add rdi, rcx
mov al, byte [rdi]
cmp al, 'y'
jne not_y
; lea r8, [rel filenum]
mov r8, 4
push r8
; mov [filenum], r8
jmp done
not_y:
sub al, '1'
push rax
; lea r8, [rel filenum]
; mov r8b, al
jmp done
strlen:
xor rax, rax
xor rcx, rcx
not rcx
repnz scasb
not rcx
dec rcx
mov rax, rcx
ret
done:
%endmacro

section .rodata
cur_file: db __FILE__, 0
format_NAME: db "Sully_%d", 0
format_filename: db "%s.s", 0
format_gcc: db "nasm -f elf64 -g %1$s.s -o %1$s.o && gcc -Wall -Wextra -Werror %1$s.o -o %1$s", 0
format_exec: db "./%s", 0
string: db "section .note.GNU-stack%1$c%1$cextern dprintf%1$cextern sprintf%1$cextern system%1$c%1$c%define O_RDRW_O_CREAT_O_TRUNC (00000002o | 00000100o | 00001000o)%1$c%define S_IRWXU 700o%1$c%1$c%macro findFileNum 0%1$clea rdi, [rel cur_file]%1$ccall strlen%1$cmov rcx, rax%1$csub rcx, 3%1$clea rdi, [rel cur_file]%1$cadd rdi, rcx%1$cmov al, byte [rdi]%1$ccmp al, 'y'%1$cjne not_y%1$clea r8, [rel filenum]%1$cmov r8, 4%1$cjmp done%1$cnot_y:%1$csub al, '1'%1$clea r8, [rel filenum]%1$cmov r8b, al%1$cjmp done%1$cstrlen:%1$cxor rax, rax%1$cxor rcx, rcx%1$cnot rcx%1$crepnz scasb%1$cnot rcx%1$cdec rcx%1$cmov rax, rcx%1$cret%1$cdone:%1$c%endmacro%1$c%1$csection .rodata%1$ccur_file: db __FILE__, 0%1$cformat_NAME: db %2$cSully_%d%2$c, 0%1$cformat_filename: db %2$c%s.s%2$c, 0%1$cformat_gcc: db %2$cnasm -f elf64 -g %1$s.s -o %1$s.o && gcc -Wall -Wextra -Werror %1$s.o -o %1$s%2$c, 0%1$cformat_exec: db %2$c./%s%2$c, 0%1$cstring: db %2$c%3$c%2$c, 0%1$ci: equ %4$d%1$c%1$csection .data%1$cfilenum: db 10%1$cNAME: times 100 db 0%1$cfilename: times 100 db 0%1$cgcc: times 500 db 0%1$cexec: times 100 db 0%1$c%1$csection .text%1$cglobal main%1$c%1$cmain:%1$center 0, 0%1$cfindFileNum%1$clea rax, [rel filenum]%1$ccmp rax, 0%1$cjl _end%1$c%1$cxor rax, rax%1$cxor rdi, rdi%1$cxor rsi, rsi%1$clea rdx, [rel format_NAME]%1$clea rcx, [rel filenum]%1$ccall sprintf wrt ..plt%1$cinc rax%1$cmov rsi, rax%1$clea rdi, [rel NAME]%1$clea rdx, [rel format_NAME]%1$clea rcx, [rel filenum]%1$cmov al, 0%1$ccall sprintf wrt ..plt%1$c%1$cxor rax, rax%1$cxor rdi, rdi%1$cxor rsi, rsi%1$clea rdx, [rel format_filename]%1$clea rcx, [rel NAME]%1$ccall sprintf wrt ..plt%1$cinc rax%1$cmov rsi, rax%1$clea rdi, [rel filename]%1$clea rdx, [rel format_filename]%1$clea rcx, [rel NAME]%1$cmov al, 0%1$ccall sprintf wrt ..plt%1$c%1$cmov rax, 2%1$clea rdi, [rel filename]%1$cmov rsi, O_RDRW_O_CREAT_O_TRUNC%1$cmov rdx, S_IRWXU%1$csyscall%1$cpush rax%1$cmov rdi, rax%1$clea rsi, [rel string]%1$cmov rdx, 0x0A%1$cmov rcx, 0x22%1$clea r8, [rel string]%1$clea r9, [rel filenum]%1$cmov al, 0%1$ccall dprintf wrt ..plt%1$cpop rdi%1$cmov rax, 3%1$csyscall%1$c%1$cxor rax, rax%1$cxor rdi, rdi%1$cxor rsi, rsi%1$clea rdx, [rel format_gcc]%1$clea rcx, [rel NAME]%1$ccall sprintf wrt ..plt%1$cinc rax%1$cmov rsi, rax%1$clea rdi, [rel gcc]%1$clea rdx, [rel format_gcc]%1$clea rcx, [rel NAME]%1$cmov al, 0%1$ccall sprintf wrt ..plt%1$ccall system wrt ..plt%1$c%1$cxor rax, rax%1$cxor rdi, rdi%1$cxor rsi, rsi%1$clea rdx, [rel format_exec]%1$clea rcx, [rel NAME]%1$ccall sprintf wrt ..plt%1$cinc rax%1$cmov rsi, rax%1$clea rdi, [rel exec]%1$clea rdx, [rel format_exec]%1$clea rcx, [rel NAME]%1$cmov al, 0%1$ccall sprintf wrt ..plt%1$ccall system wrt ..plt%1$c%1$c_end:%1$cxor rax, rax%1$cleave%1$cret", 0
i: equ 5

section .data
; filenum: db 10
NAME: times 100 db 0
filename: times 100 db 0
gcc: times 500 db 0
exec: times 100 db 0

section .text
global main

main:
enter 0, 0
findFileNum
; lea rax, [rel filenum]
pop rax
push rax
cmp rax, 0
jl _end

xor rax, rax
lea rdi, [rel NAME]
lea rsi, [rel format_NAME]
; lea rcx, [rel filenum]
pop rdx
push rdx
debug:
call sprintf wrt ..plt

xor rax, rax
xor rdi, rdi
xor rsi, rsi
lea rdx, [rel format_filename]
lea rcx, [rel NAME]
call sprintf wrt ..plt
inc rax
mov rsi, rax
lea rdi, [rel filename]
lea rdx, [rel format_filename]
lea rcx, [rel NAME]
mov al, 0
call sprintf wrt ..plt

mov rax, 2
lea rdi, [rel filename]
mov rsi, O_RDRW_O_CREAT_O_TRUNC
mov rdx, S_IRWXU
syscall
mov rdi, rax
lea rsi, [rel string]
mov rdx, 0x0A
mov rcx, 0x22
lea r8, [rel string]
; lea r9, [rel filenum]
pop r9
push rax
mov al, 0
call dprintf wrt ..plt
pop rdi
mov rax, 3
syscall

xor rax, rax
xor rdi, rdi
xor rsi, rsi
lea rdx, [rel format_gcc]
lea rcx, [rel NAME]
call sprintf wrt ..plt
inc rax
mov rsi, rax
lea rdi, [rel gcc]
lea rdx, [rel format_gcc]
lea rcx, [rel NAME]
mov al, 0
call sprintf wrt ..plt
call system wrt ..plt

xor rax, rax
xor rdi, rdi
xor rsi, rsi
lea rdx, [rel format_exec]
lea rcx, [rel NAME]
call sprintf wrt ..plt
inc rax
mov rsi, rax
lea rdi, [rel exec]
lea rdx, [rel format_exec]
lea rcx, [rel NAME]
mov al, 0
call sprintf wrt ..plt
call system wrt ..plt

_end:
xor rax, rax
leave
ret