#!/bin/bash

if [ -d $1 ];then
   echo "$1 found"
   if [ -f "$1/output.log" ];then
      echo "output.log file found"
      EC=$(grep -icwo "error" $1/output.log )
      WC=$(grep -icwo "warning" $1/output.log )
      echo "total errors are $EC"
      echo "total warnings are $WC"
      
      if [ $EC -ne 0 ];then
          echo "you can't proceed further, Fix now and go"
      else
           if [ $WC -ne 0 ] ; then
               echo "you have few warnings, better you fix them, still you can proceed further"
            else
                echo "Build is successful"
            fi
       fi 
    else
        echo "output.log  not found"
    fi
else
      echo "$1 not found"
fi      
