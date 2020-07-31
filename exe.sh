
#!/bin/bash
if [ $# -eq 3 ]
then
        aux=$(echo $1 | cut -d '/' -f 2);
        file=$(echo $aux | cut -f 1 -d '.');
        echo -e "\e[36m Archive:  ${aux}\e[0m";
        nasm -felf64 $1 -o $2$file.o;
        ld -o $3$file $2$file.o;
        ./$3$file;
        echo "";
        echo -e "\e[32m compiled and executed successfully !!\e[0m";
else
        echo -e "\e[91m Error -> Enter 3 arguments (Location): asm, obj, exe.\e[0m";
fi

# 2 obj directory 
# 3 eje directory 