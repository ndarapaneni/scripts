#!/bin/bash

memory=$(free -g | awk '{print $4 }' | head -2| tail -1)
fullmemo=$(free -g | awk '{print $2}'|head -2 |tail -1)
p="$((100*$memory/$fullmemo))"
echo "Percentage of Memory available is: $p% "
if [ "$p" -lt 30 ];
then 
   echo "you are running on low memory:: you have only $p%"
else
    echo "you are good, you have $p% memory"
fi


