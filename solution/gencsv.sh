#!/bin/bash

rm -f inputFile
if [  -n  "$1" ]; then
    if [ "$1" -gt 0 ]; then
        printf "inputFile will be created with $1 entries.\n"
        noOfEntries=$1
    else
        printf "Argument must be a non-zero, positive integer. Please pass a valid value.\n"
        exit 1
    fi
else
    printf "inputFile will be created with 10 entries.\n"
    noOfEntries=10
fi

for (( i=0; i<$noOfEntries; i++ ))
do
   echo "$i,$RANDOM" >> inputFile
done