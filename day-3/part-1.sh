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

x=0
y=0
count=1
steps=265149
distance=1
moves=0
nextmove="right"

while [ $count -le $steps ]
  do
  if [ $steps -eq $count ]; then
    echo "$steps - ($x,$y)"
    break
  fi
  move
  count=$(( count + 1 ))
  done

if [ $x -lt 0 ]; then
  x=$(( x * -1 ))
fi
if [ $y -lt 0 ]; then
  y=$(( y * -1 ))
fi
sum=$(( x + y ))
echo $sum
