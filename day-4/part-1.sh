#!/bin/bash
# TR3N
# 2017-advent 4:1

lines=$(cat input | wc -l)
count=1
goodcount=0

if [ -f valid-lines ]; then rm valid-lines; fi

while [ $count -le $lines ]
  do
  line=$(cat input | head -$count | tail -1)

  for i in $line
    do
    echo $i >> line.out
    done

  for phrase in $line
    do
    phrasecount=$(cat line.out | grep -w $phrase | wc -l)
    if [ $phrasecount -gt 1 ]; then
      badcount=1
    fi
    done

  if [ $badcount -eq 0 ]; then
    goodcount=$(( goodcount + 1 ))
  fi

  badcount=0
  rm line.out
  count=$(( count + 1))

  done

echo $goodcount
