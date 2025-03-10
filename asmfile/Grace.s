section .note.GNU-stack
extern dprintf
; comment
%define msg "section .note.GNU-stack%1$cextern dprintf%1$c; comment%1$c%%define msg %3$c%4$s%3$c%1$c%%define O_RDRW_O_CREAT_O_TRUNC (00000002o | 00000100o | 00001000o)%1$c%%define S_IRWXU 511o%1$c%%macro main 0%1$csection .data%1$c%2$cfilename: db %3$cGrace_kid.s%3$c, 0%1$c%2$cstring: dw msg, 0%1$csection .text%1$c%2$cglobal main%1$cmain:%1$c%2$center 0, 0%1$c%2$cmov rax, 2%1$c%2$clea rdi, [rel filename]%1$c%2$cmov rsi, O_RDRW_O_CREAT_O_TRUNC%1$c%2$cmov rdx, S_IRWXU%1$c%2$csyscall%1$c%2$cmov rdi, rax%1$c%2$clea rsi, [rel string]%1$c%2$cmov rdx, 0x0A%1$c%2$cmov rcx, 0x09%1$c%2$cmov r8, 0x22%1$c%2$clea r9, [rel string]%1$c%2$cmov al, 1%1$c%2$ccall dprintf wrt ..plt%1$c%2$cmov rax, 3%1$c%2$csyscall%1$c%2$cxor rax, rax%1$c%2$cleave%1$c%2$cret%1$c%%endmacro%1$cmain"
%define O_RDRW_O_CREAT_O_TRUNC (00000002o | 00000100o | 00001000o)
%define S_IRWXU 511o
%macro main 0
section .data
	filename: db "Grace_kid.s", 0
	string: dw msg, 0
section .text
	global main
main:
	enter 0, 0
	mov rax, 2
	lea rdi, [rel filename]
	mov rsi, O_RDRW_O_CREAT_O_TRUNC
	mov rdx, S_IRWXU
	syscall
	mov rdi, rax
	lea rsi, [rel string]
	mov rdx, 0x0A
	mov rcx, 0x09
	mov r8, 0x22
	lea r9, [rel string]
	mov al, 1
	call dprintf wrt ..plt
	mov rax, 3
	syscall
	xor rax, rax
	leave
	ret
%endmacro
main