#!/bin/bash

if [ -d $1 ];then
   echo "$1 found"
   if [ -f "$1/output.log" ];then
      echo "output.log file found"
      EC=$(grep -i "error" $1/output.log -o | wc -w)
      WC=$(grep -i "warning" $1/output.log -0 | wc -w)
      echo "total errors are $EC"
      echo "total warnings are $WC"
      if [ $EC -eq 0 ] && [ $WC -eq 0 ];then
         echo "you are good, you can proceed"
      else
          echo "you can't proceed further, Fix now and go"
          echo "you have few warnings, better you fix them, still you can proceed"
      fi
   else
      echo "output.log  not found"
   fi
else
   echo "$1 not found"
fi      
