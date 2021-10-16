#!/bin/bash
target=$1
path=$2
waybackurls $target > $path/endpoints
