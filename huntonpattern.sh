#!/bin/bash
#Look for open redirect and xss on the sorted list that was generated via pattern
path=$1
output=$2

cat $path/openredirect |  qsreplace "https://evil.com" | while read host do; do curl -s -L $host -I | grep "evil.com" && echo "$host Vulnerable"; done >> $output/openredirect
cat $path/xss | dalfox pipe >> $output/xss

