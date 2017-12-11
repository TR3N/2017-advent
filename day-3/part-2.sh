#!/bin/bash
# TR3N
#2017-advent 3:1

move () {
case $nextmove in
  right)
    x=$(( x + 1 ))
    moves=$(( moves + 1))
    if [ $moves -eq $distance ]; then
      nextmove="up"
      moves=0
    fi
  ;;
  up)
    y=$(( y + 1 ))
    moves=$(( moves + 1))
    if [ $moves -eq $distance ]; then
      nextmove="left"
      distance=$(( distance + 1 ))
      moves=0
    fi
  ;;
  left)
    x=$(( x - 1 ))
    moves=$(( moves + 1))
    if [ $moves -eq $distance ]; then
      nextmove="down"
      moves=0
    fi
  ;;
  down)
    y=$(( y - 1 ))
    moves=$(( moves + 1 ))
    if  [ $moves -eq $distance ]; then
      nextmove="right"
      distance=$(( distance + 1 ))
      moves=0
    fi
  ;;
esac
}

adjacents () {
  for xp in -1 0 1
    do
    xn=$(( x + xp ))
    for yp in -1 0 1
      do
      yn=$(( y + yp ))
      if [ $xp -eq 0 ] && [ $yp -eq 0 ]; then
        continue
      fi
      echo "($xn,$yn)" >> ajcoords
      done 
    done
}

getvalue () {
if [ $x -eq 0 ] && [ $y -eq 0 ]; then
  value=1
else
value=0
for coords in $(cat ajcoords)
  do
  AJ=$(cat advent-db | grep -i $coords | awk '{print $1}')
  if [ -z $AJ ]; then
    continue
  else
    value=$(( value + $AJ ))
  fi
  done
fi
rm ajcoords
}

x=0
y=0
count=1
steps=265149
distance=1
moves=0
nextmove="right"
value=0

if [ -f advent-db ]; then
  rm advent-db
fi

while [ $count -le $steps ]
  do
  if [ $value -gt $steps ]; then
    cat advent-db | tail -1
    rm advent-db
    break
  fi
  adjacents
  getvalue
  echo "$value ($x,$y) $count" >> advent-db
  move
  count=$(( count + 1 ))
  done
