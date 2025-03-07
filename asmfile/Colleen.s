section .note.GNU-stack
extern printf
section .text
	global main

; This is a comment

main:
	; In Start
	enter 0, 0
	call func
	xor rax, rax
	leave
	ret

func:
	enter 0, 0
	lea rdi, [rel format]
	mov rsi, 0x0A
	mov rdx, 0x09
	mov rcx, 0x22
	mov r8, 0x25
	lea r9, [rel format]
	mov al, 0
	call printf wrt ..plt
	leave
	ret

section .data
	format: dw "section .note.GNU-stack%1$cextern printf%1$csection .text%1$c%2$cglobal main%1$c%1$c; This is a comment%1$c%1$cmain:%1$c%2$c; In Start%1$c%2$center 0, 0%1$c%2$ccall func%1$c%2$cxor rax, rax%1$c%2$cleave%1$c%2$cret%1$c%1$cfunc:%1$c%2$center 0, 0%1$c%2$clea rdi, [rel format]%1$c%2$cmov rsi, 0x0A%1$c%2$cmov rdx, 0x09%1$c%2$cmov rcx, 0x22%1$c%2$cmov r8, 0x25%1$c%2$clea r9, [rel format]%1$c%2$cmov al, 0%1$c%2$ccall printf wrt ..plt%1$c%2$cleave%1$c%2$cret%1$c%1$csection .data%1$c%2$cformat: dw %3$c%5$s%3$c, 0", 0