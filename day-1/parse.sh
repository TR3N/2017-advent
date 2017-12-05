#!/bin/bash
# TR3N
# 2017-advent day 1

input=$(cat input)

count=0
sum=0

while [ ! -z "${input:count:1}" ]
  do
  if [ -z "$NUM" ]; then
    NUM=${input:count:1}
    count=$(( count + 1))
  fi
  if [ "$NUM" == "${input:count:1}" ]; then
    sum=$(( sum + NUM ))
    count=$(( count + 1))
    unset NUM
  else
    count=$(( count + 1))
  fi
  done
echo $sum
