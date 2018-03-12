;; initialized data
section .data
	SYS_WRITE	equ 1
	STD_OUT		equ 1
	SYS_EXIT	equ 60
	EXIT_CODE	equ 0

	NEW_LINE	db 0xa
	INPUT		db "Black Sabbath"

;; non initialized data
section .bss
	OUTPUT	resb 1

;; code
section .text
	global	_start

;; main routine
_start:
	; get addres of INPUT
	mov	rsi, INPUT
	; zeroize rcx for counter
	xor	rcx, rcx
	; df = 0 si++
	cld
	; remember place after function call
	mov	rdi, $ + 15
	; get string lengt
	call	string_len
	; write zeros to rax
	xor	rax, rax
	; additional counter for reverseStr
	xor	rdi, rdi
	; reverse string
	jmp	reverse_string

;; calculate length of string
string_len:
	; check is it end of string
	cmp	byte [rsi], 0
	; if yes exit from function
	je	exit_from_routine
	; load byte from rsi to al and inc rsi
	lodsb
	; push symbol to stack
	push	rax
	; increase counter
	inc	rcx
	; loop again
	jmp	string_len

;; back to _start
exit_from_routine:
	; push return addres to stack again
	push	rdi
	; return to _start
	ret

;; reverse string
reverse_string:
	; check is it end of string
	cmp	rcx, 0
	; if yes print result string
	je	print_result
	; get symbol from stack
	pop	rax
	; write it to output buffer
	mov	[OUTPUT + rdi], rax
	; decrease length counter
	dec	rcx
	; increase additional length counter (for write syscall)
	inc	rdi
	; loop again
	jmp	reverse_string

;; Print result string
print_result:
	mov	rdx, rdi
	mov	rax, SYS_WRITE
	mov	rdi, 1
	mov	rsi, OUTPUT
	; call sys_write
	syscall
	jmp	print_new_line

;; Print new line
print_new_line:
	mov	rax, SYS_WRITE
	mov	rdi, STD_OUT
	mov	rsi, NEW_LINE
	mov	rdx, 1
	; call sys_write
	syscall
	jmp	exit

;; exit program
exit:
	mov	rax, SYS_EXIT
	mov	rdi, EXIT_CODE
	; call sys_exit
	syscall