#!/bin/bash

path=$1
output=$2
cat $path/live_subdomains | nuclei -c 500 -silent -t ~/tools/nuclei-templates/ -o $output/nuclei;

