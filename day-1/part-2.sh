#!/bin/bash
# TR3N
# 2017-advent 1:1

input=$(cat input)
TOTAL=${#input}
count=0
sum=0
HALF=$(( TOTAL / 2 ))

while [ $count -lt $TOTAL ]
  do
  A=${input:count:1}
  C=$(( count + HALF ))

  if [ $C -ge $TOTAL ]; then
    B=$(( C - $TOTAL ))
  else 
    B=$C
  fi

  B=${input:B:1}

  if [ $A -eq $B ]; then
    sum=$(( sum + $A ))
  fi

  count=$(( count + 1 ))

  done

echo $sum
