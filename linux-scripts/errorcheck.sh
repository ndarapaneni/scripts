#!/bin/bash

if [ -f "$1" ];then
echo "$1 file found"
EC=$(grep -i "error" $1 -o | wc -w)
echo "It has $EC errors"
ER=$(grep -A 3 -i "error" $1)
echo "$ER"
else
   echo "$1 not found"
fi

