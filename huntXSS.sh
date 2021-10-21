#!/bin/bash
#Hunt for XSS using dalfox on the parameters gathered
path=$1
output=$2

dalfox -b hahwul.xss.ht file $path/params > $output/potential_xss;

