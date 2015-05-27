#!/bin/bash

DIR=$1
DATE=`date +%m%d%y:%H:%M:%S`
ZIP_FILE=$DIR/`basename $DIR`.$DATE.tar.gz
if [ -d "$DIR" ] ; then

echo "Found below files to compress"
find $DIR -type f -maxdepth 1 -mmin +5 
 find $DIR -type f -maxdepth 1 -mmin +5 | xargs tar -zcvf $ZIP_FILE --remove-files

if [ -f $ZIP_FILE ];then
    echo " Successfully created compressed file $ZIP_FILE"  
else
    echo "Something wrong in compression. Please check"
fi

echo "Below are files to delete"
 find $DIR -type f -name "*.tar.gz" -mmin +10 

 find $DIR -type f -name "*.tar.gz" -mmin +10 -exec rm {} \;
if [ $? != 0 ];then
  echo "could not delete files"
else 
  echo "Deleted older files"   
fi

 echo "$DATE" >> ~/Backup_run.log
 echo "Added entry to ~/Backup_run.log"

else
 echo "$DIR not found. Please provide valid dir"
fi  
