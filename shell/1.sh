#!/bin/sh  
rm -rf 3.txt
for((i=1;i<=10;i++))
do
sed 's/^/'"$i"'/g' 111.csv>>3.txt
done


