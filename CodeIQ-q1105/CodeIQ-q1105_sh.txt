#!/bin/bash
for n in `seq 5 7`
do
for i in `seq 1 $n`
do
for j in `seq 1 $i`
do
echo -n "*"
done
j=`expr $n - $i`
while [ $j -gt 0 ]
do
echo -n " "
j=`expr $j - 1`
done
j=`expr $n - $i + 1`
while [ $j -gt 0 ]
do
echo -n "*"
j=`expr $j - 1`
done
echo
done
for i in `seq 1 $n`
do
j=`expr $n - $i`
while [ $j -gt 0 ]
do
echo -n " "
j=`expr $j - 1`
done
for j in `seq 1 $i`
do
echo -n "*"
done
for j in `seq 2 $i`
do
echo -n " "
done
j=`expr $n - $i + 1`
while [ $j -gt 0 ]
do
echo -n "*"
j=`expr $j - 1`
done
echo
done
done
