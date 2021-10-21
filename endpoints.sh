#!/bin/bash
#Gather Endpoints via wayback machine and paramspider
target=$1
output=$2
waybackurls $target > $output/endpoints
python3 ~/tools/ParamSpider/paramspider.py  -d $target -l high -o $output/params  --exclude woff,css,js,png,svg,php,jpg;
