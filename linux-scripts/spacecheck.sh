#!/bin/bash

space=$(df -hT $HOME | awk '{print $5 }' | tail -1 | cut -c1-2)

if [ "$space" -gt  5 ];
then 
   echo "you are good,you have $space G"
else
   echo "you have $space, so it is more than 5G, delete some items"
fi
