;; initialized data
section .data
    SYS_WRITE	equ 1
	STD_OUT		equ 1
	SYS_EXIT	equ 60
	EXIT_CODE	equ 0

    msg db      "Hello, World!", 0xA
    len equ     $ - msg

;; code
section .text
    global _hello

;; main routine
_hello:
    ; print message
    mov     rax, SYS_WRITE
    mov     rdi, 1
    mov     rsi, msg
    mov     rdx, len
    ; call sys_write
    syscall
    ; finish program
    jmp .exit

;; exit program
.exit:
    mov    rax, SYS_EXIT
    mov    rdi, EXIT_CODE
    ; call sys_exit
    syscall