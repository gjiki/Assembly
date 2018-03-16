# This repository is created for learning Linux x86-64 Assembly and its integration with C && C++ codes

How to compile and run Assembly files

    nasm -f elf64 -o name.o filename.asm

    ld -o exec_name name.o

    ./exec_name
How to compile and run C/Assembly integration

    nasm -f elf64 -o asm_out.o asm_code_name.asm

    gcc c_code_name.c c_out.o -o exec_name

    ./exec_name
