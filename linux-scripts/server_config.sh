#!/bin/bash

echo "$(hostname)"
echo "$USER"
ostype=$(cat /etc/*-release | head -2 | tail -1 | awk -F'=' '{ print $2 }')
echo "OS type is: $ostype"
processorBit=$(getconf LONG_BIT)
echo "processor is :$processorBit bits processor"
NUMBEROFDISK=$(df -h| grep ^/dev |awk '{print $2}' |wc -l)
echo "Number of disks are: $NUMBEROFDISK"
SIZE=$(df -h| grep ^/dev |awk '{print $2}')
echo "Size os disk is : $SIZE"
TM=$(less /proc/meminfo | grep -i "memtotal" | awk '{print $2}' )
echo "Total Memory is : $TM "
cores=$(nproc)
echo "number of cores are: $cores"
CT=$(less /proc/cpuinfo | grep -i "model name" |head -1)
echo "CPU Type is : $CT"
UT=$(uptime | awk -F'up' '{print $2 }' | awk -F',' '{print $1}')
echo "Uptime is : $UT"
