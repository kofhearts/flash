#!/bin/sh
# Use Gf patterns to sort out endpoints by possible xss, sqli and open redirect.
path=$1
output=$2

cat $path/endpoints | gf xss | sed 's/=.*/=/' | sed 's/URL: //' | tee $output/xss
#gf ssrf $path/endpoints | sort -u > $output/ssrf;
gf sqli $path/endpoints | sort -u > $output/sqli;
cat $path/endpoints | grep -a -i \=http > $output/openredirect;
#gf rce  $path/endpoints | sort -u > $output/rce;

