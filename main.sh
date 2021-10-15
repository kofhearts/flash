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


