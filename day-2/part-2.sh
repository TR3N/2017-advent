#!/bin/bash
# TR3N
# 2017-advent 2:2
#set -x

linecount=$(cat input | wc -l)
sum=0
count=1
while [ $count -lt $linecount ]; 
  do
  for i in `cat input | head -$count | tail -1`
    do 
    for x in `cat input | head -$count | tail -1`
      do 
      remainder=`echo "${x}%${i}" | bc`
        if [ "$remainder" == "0" ]; then 
          if [ $x -ne $i ]; then
            DIVIDE=$(( $x / $i ))
            sum=$(( sum + $DIVIDE ))
          fi
        fi
      done
    done
      count=$(( count + 1 ))
  done
echo $sum
