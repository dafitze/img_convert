#!/bin/bash

lumin=70

# ========================================
# change color
# ========================================
rm out/*
cd in 
for j in *.jpg
do 
  magick "$j" -colorspace Gray  ../out/"$j"
done
cd ../out

# ========================================
# change luminance
# ========================================
for j in *.jpg
do 
  magick "$j" -brightness-contrast "%[fx:${lumin}-(mean*100)]" "$j"
done

# ========================================
# change background color
# ========================================
# colors:
#   example grey:  #999999
#   example white: #FFFFFF
#   example red:   #FF0000
for j in *.jpg
do 
  convert "$j" \
    -fill '#FF0000' -fuzz 20% \
    -draw 'color 0,0 floodfill' \
    "$j"
  done



