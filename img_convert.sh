#!/bin/bash

lumin=74.12

#convert in/1.HEIC -colorspace Gray out/1.jpg

cd in 
for j in *.HEIC
do 
  magick "$j" -colorspace Gray -brightness-contrast "%[fx:${lumin}-(mean*100)]" ../out/"$j"
done

