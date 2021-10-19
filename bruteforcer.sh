#!/bin/bash

path=$1
output=$2
python3 ~/tools/dirsearch/dirsearch.py -l $path/live_subdomains -t 300 -i 200,201,202,203,204,301,302,303,304 -b --format=html -o $output/founddirectories.html
