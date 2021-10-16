#!/bin/bash


target=$1;

echo "Starting Flash";

if [[ ! -d $target ]]
then
  mkdir $target

else
   echo "Error: Directory already exists!";
   exit 
fi

echo "Starting Subdomain enumeration";
if [[ ! -d $target/subdomains ]]
then
  mkdir $target/subdomains
  ./enumerator.sh $target $target/subdomains
else
  echo "Error: Directory already exists!";
  exit
fi


echo "Starting Prober";
if [[ -f $target/subdomains/final_subdomains ]]
then
  ./prober.sh $target/subdomains
else
  echo "Error: No Subdomains Enumerated";
fi


echo "Starting Template Scan";
if [[ -f $target/subdomains/live_subdomains ]]
then
  mkdir $target/templatescan
  ./templatescan.sh $target/subdomains $target/templatescan
else
  echo "Error: No live subdomains";
  exit
fi

echo "Searching Endpoints using Wayback machine";
mkdir $target/endpoints
./endpoints.sh $target $target/endpoints

echo "GF pattern search"
if [[ -f $target/endpoints/endpoints ]]
then
  mkdir $target/patternsearch
  ./patternsearch.sh $target/endpoints $target/patternsearch
else
  echo "Error: No Endpoints";
  exit
fi


echo "Hunting Vulnerability on Patterns";
mkdir $target/vulnerability
./huntonpattern.sh $target/patternsearch $target/vulnerability

echo "Searching Directory"
mkdir $target/directory
./bruteforcer.sh $target/subdomains $target/directory


echo "Hunt for XSS";
mkdir $target/XSS
./huntXSS.sh $target/endpoints $target/XSS


echo "Screenshot Live Subdomains";
mkdir $target/screenshot
./screenshooter.sh $target/endpoints $target/screenshot
