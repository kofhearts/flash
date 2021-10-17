#!/bin/bash

target=$1;
path=$2;
if [[ -d $path ]]
then
  subfinder -d $target > $path/subfinder
  echo $target >> $path/subfinder
#  assetfinder -subs-only $target > $path/assetfinder
 # amass enum --passive -d $target > $path/amass
else
  echo "Error: Directory doesn't exists!"
  exit
fi

echo "Removing Duplicates and Sorting found subdomains";
cat $path/* > $path/unfiltered_subdomains
sort $path/unfiltered_subdomains | uniq -u | tee $path/final_subdomains


