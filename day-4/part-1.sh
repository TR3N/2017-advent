#!/bin/bash
# TR3N
# 2017-advent 4:1

lines=$(cat input | wc -l)
count=1
wordcount=0

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

  if [ $badcount -eq 1 ]; then
    echo "line $count invalid"
  else
    echo "$line" >> valid-lines
  fi

  badcount=0
  rm line.out
  count=$(( count + 1))

  done

cat valid-lines | wc -l
rm valid-lines
