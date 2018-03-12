;; initialized data
section .data
    SYS_WRITE	equ 1
	STD_OUT		equ 1
	SYS_EXIT	equ 60
	EXIT_CODE	equ 0

    num1: equ 5
    num2: equ 7
    greater_msg: db ">"
    smaller_msg: db "<"

;; code
section .text
    global _start

;; main routine
 _start:
    ; compare two numbers
    mov r8, num1
    mov r9, num2
    cmp r8, r9
    ; jump to greater if num1 > num2
    jg .greater
    ; jump to smaller if num1 < num2
    jmp .smaller

;; print greater_msg and finish program
.greater:
    ; print message
    mov     rax, SYS_WRITE
    mov     rdi, 1
    mov     rsi, greater_msg
    mov     rdx, 1
    ; call sys_write
    syscall
    ; finish program
    jmp .exit

;; print smaller_msg and finish program
.smaller:
    ; print message
    mov     rax, SYS_WRITE
    mov     rdi, 1
    mov     rsi, smaller_msg
    mov     rdx, 1
    ; call sys_write
    syscall
    ; finish program
    jmp .exit

;; exit program
.exit:
    mov    rax, SYS_EXIT
    mov    rdi, EXIT_CODE
    syscall
