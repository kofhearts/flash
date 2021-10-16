#!/bin/bash

path=$1
output=$2

eyewitness -f $path/live_subdomains -d screenshot --web --timeout 15
mv /usr/share/eyewitness/screenshot $output
