#!/bin/bash
# TR3N
# 2017-advent 1:1

input=$(cat input)
TOTAL=${#input}
count=0
sum=0

while [ $count -lt $TOTAL ]
  do
  A=${input:count:1}
  B=${input:$(( count + 1 )):1}

  if [ -z $B ]; then
    B=${input:0:1}
  fi

  if [ $A -eq $B ]; then
    sum=$(( sum + $A ))
  fi

  count=$(( count + 1 ))

  done

echo $sum
