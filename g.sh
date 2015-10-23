#! /bin/bash

if [ $# -ne 1 ]
then
echo "************* Error  ************"
echo "Please input correct command"
echo "usage: . g notes"
exit 1
fi

if [ $1 = h ]
then
echo "usage: . g xxx"
echo "xxx can be any of 'h','notes','debug'"
fi


if [ $1 = notes ]
then
cd /home/hongbo/Desktop/WORK/notes

elif [ $1 = debug ]
then
cd /home/hongbo/Desktop/DEBUG


fi
