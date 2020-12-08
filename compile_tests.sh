#!/bin/zsh

#for i in l2_programs/*.l2
#for i in l1_programs/*.cb
#for i in l22_programs/*.l2
for i in tests/*.l2
do
    echo "Compiling $i to $i.exe.asm"
    ./build/c1 $i --gen-asm-only $i.exe.asm && (
        echo "Assembling and linking $i.asm with bootstrap code to produce $i.exe"
        ./build/c1 $i $i.exe
    )
    echo "\n"
done
