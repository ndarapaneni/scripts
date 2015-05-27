#!/bin/bash

DIR=$1
DC=$(find $DIR ! -path $DIR -type d |wc -l)
FC=$(find $DIR -type f |wc -l)
TFC=$(find $DIR -type f -name '*.*'|awk -F'.' '{print $NF}'|sort|uniq -c)
find $DIR -type f -name '*.*'|awk -F'.' '{print $NF}'|sort|uniq -c|awk '{print $1}' > numbers.txt
SUM=0
count=0
NEX=$(find $DIR -type f | awk -F'/' '{print $NF}'| grep -v '\.'|sort|uniq -c)
find $DIR -type f | awk -F'/' '{print $NF}'|grep -v '\.'|sort|uniq -c|awk '{print $1}' > number2.txt
if [ -d $DIR ]; then
   echo "Total number of directories: $DC"
   echo "Total number of files: $FC"
   echo -e  "Files with extension:\n$TFC"
   while read num;do
        SUM=$(($SUM+$num));
   done < numbers.txt;
        echo "Total of extension files : $SUM"
   echo -e "Files without extension: \n $NEX"
   while read num;do
       count=$(($count+$num));
   done < number2.txt;
        echo "Total number of non extension files : $count" 
else
   echo "It's not directory, Please give directory as a argument input"
fi
