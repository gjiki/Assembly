;; initialized data
section .data
	SYS_WRITE	equ 1
	STD_OUT		equ 1
	SYS_EXIT	equ 60
	EXIT_CODE	equ 0

	num1:	equ 5
	num2:	equ 7
	msg:	db "Sum is correct", 10

;; code
section .text
	global	_start

;; main routine
_start:
	; get sum of num1 and num2
	mov	rax, num1
	mov	rbx, num2
	add	rax, rbx
	; compare rax with correct sum - 150
	cmp	rax, 12
	; if rax is not 150 go to exit
	jne	.exit
	; if rax is 150 print msg
	jmp	.print

;; prinr message and finish program
.print:
	; print message
	mov	rax, SYS_WRITE
	mov	rdi, 1
	mov	rsi, msg
	mov	rdx, 15
	; call sys_write
	syscall
	jmp	.exit

;; exit program
.exit:
	mov	rax, SYS_EXIT
	mov	rdi, 0
	; call sys_exit
	syscall