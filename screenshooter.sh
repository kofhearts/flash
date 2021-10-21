#!/bin/bash
#Screenshot all the subdomains discovered
path=$1
output=$2

eyewitness -d $output --web -f $path/live_subdomains --no-prompt

