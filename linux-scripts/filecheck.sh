#!/bin/bash


if [ -d "$1" ];
then
   echo "$1 found, and it is directory"
else
  
   if [ -f "$1" ];then
       echo "$1 found, and it is a file"
   else
       echo "$1 not found"
   fi
fi
