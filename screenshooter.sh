#!/bin/bash

path=$1
output=$2

eyewitness -d $output --web -f $path/live_subdomains --no-prompt

