# There are some simple linux-x64 Assembly code examples
How to compile :

nasm -f elf64 -o name.o filename.asm

ld -o exec_name name.o

Run :

./exec_name
