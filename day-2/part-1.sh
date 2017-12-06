#!/bin/bash
# TR3N
# 2017-advent 2:1

input=$(cat input)
linecount=$(cat input | wc -l)


count=1
checksum=0
while [ $count -le $linecount ]
  do
  highest=$(for i in `cat input | head -$count | tail -1`; do echo $i ; done | sort -n  | tail -1)
  lowest=$(for i in `cat input | head -$count | tail -1`; do echo $i ; done | sort -n  | head -1)
  difference=$(( highest - lowest ))
  checksum=$(( checksum + difference ))
  count=$(( count + 1 ))
  done
echo $checksum
