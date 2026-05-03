#!/bin/bash


for file in /opt/dir1/*

do 

name=$(basename "$file")

 if [[ "$name =~ ^[0-9]+$ ]]; then

   if (( name % 2 == 0 )); then
    mv  "$file"  /opt/dir2/
   fi

   fi
   done
