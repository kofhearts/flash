#!/bin/sh

path=$1
output=$2

gf xss $path/endpoints | cut -d : -f3- | sort -u > $output/xss;
gf ssrf $path/endpoints | sort -u > $output/ssrf;
gf sqli $path/endpoints | sort -u > $output/sqli;
gf redirect  $path/endpoints | cut -d : -f3- | sort -u > $output/openredirect;
gf rce  $path/endpoints | sort -u > $output/rce;

