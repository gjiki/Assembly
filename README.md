# This repository is created for learning Linux x86-64 Assembly and its integration with C && C++ codes

How to compile and run Assembly files

    nasm -f elf64 -o name.o filename.asm

    ld -o exec_name name.o

    ./exec_name
How to compile and run C/Assembly integration

    nasm -f elf64 -o asm_out.o asm_code_name.asm

    gcc c_code_name.c asm_out.o -o exec_name

    ./exec_name


CMakeLists.txt

    cmake_minimum_required(VERSION 3.12)
    project(Assembly_C_CPP_ C)

    set(CMAKE_C_STANDARD 99)
    enable_language(ASM_NASM)

    set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
    set(CMAKE_ASM_NASM_COMPILE_OBJECT "<CMAKE_ASM_NASM_COMPILER> <INCLUDES> \
        <FLAGS> -f ${CMAKE_ASM_NASM_OBJECT_FORMAT} -o <OBJECT> <SOURCE>")
        
    add_executable(exec_name asm_name.asm filename.c)
