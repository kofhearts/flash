#!/bin/bash

path=$1

cat $path/final_subdomains | httpx -follow-redirects -status-code -vhost -threads 300 -silent | sort -u | grep "[200]" | cut -d [ -f1 | sort -u | sed 's/[[:blank:]]*$//' >> $path/live_subdomains


