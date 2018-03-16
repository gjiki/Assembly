# This repository is created for learning Linux x86-64 Assembly and its integration with C && C++ codes
How to compile and run Assembly files :

nasm -f elf64 -o name.o filename.asm

ld -o exec_name name.o

./exec_name
