#!/bin/bash
p="aifcrrrircr aia iricnrnincfif uruccrcic kik  crbrrbirbcrb rri"
b="brainfuck "
for i in {0..60};do c=${c}${b/${p:$i:1}/*};done
echo ${c// /}