#!/bin/bash

echo "input extension (jpg, png, etc ...), use * for all files in the folder:"
read inExt 

echo "output extension (jpg, png, svg, gif):"
read outExt 

echo "Number of shapes, less is faster but less accurate, start at 100 for a simple image, 500 for more complex:"
read numShapes 

echo "Convert to (0=combo,1=triangle,2=rect,3=ellipse,4=circle,5=rotatedrect,6=beziers,7=rotatedellipse,8=polygon), only use one number:"
read setMod 

echo "Extra arguments? (leave empty if you don't need it an press inter):"
read extraArgs

for i in *.$inExt ; do echo $i ; ./primitive -i $i -o p-$i."$outExt" -n "$numShapes" -m "$setMod" "$extraArgs" ; done 
for r in *.$inExt.$outExt; do mv "$r" "${r%.*.*}.$outExt" ; done
