#!/bin/bash

path=$1

cat $path/final_subdomains | httpx -o $path/live_subdomains


