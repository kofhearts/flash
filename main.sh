#!/bin/bash


target=$1;

echo "
███████╗██╗░░░░░░█████╗░░██████╗██╗░░██╗
██╔════╝██║░░░░░██╔══██╗██╔════╝██║░░██║
█████╗░░██║░░░░░███████║╚█████╗░███████║
██╔══╝░░██║░░░░░██╔══██║░╚═══██╗██╔══██║
██║░░░░░███████╗██║░░██║██████╔╝██║░░██║
╚═╝░░░░░╚══════╝╚═╝░░╚═╝╚═════╝░╚═╝░░╚═╝

░█████╗░██╗░░░██╗████████╗░█████╗░███╗░░░███╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
██╔══██╗██║░░░██║╚══██╔══╝██╔══██╗████╗░████║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
███████║██║░░░██║░░░██║░░░██║░░██║██╔████╔██║███████║░░░██║░░░██║██║░░██║██╔██╗██║
██╔══██║██║░░░██║░░░██║░░░██║░░██║██║╚██╔╝██║██╔══██║░░░██║░░░██║██║░░██║██║╚████║
██║░░██║╚██████╔╝░░░██║░░░╚█████╔╝██║░╚═╝░██║██║░░██║░░░██║░░░██║╚█████╔╝██║░╚███║
╚═╝░░╚═╝░╚═════╝░░░░╚═╝░░░░╚════╝░╚═╝░░░░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝";

echo "========================================================================";

progress-bar() {
  local duration=${1}


    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }

  for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
      already_done; remaining; percentage
      sleep 1
      clean_line
  done
  clean_line
}

progress-bar 10

if [[ ! -d $target ]]
then
  mkdir $target

else
   echo "Error: Directory already exists!";
   exit 
fi

echo "Enumerating Subdomain";

if [[ ! -d $target/subdomains ]]
then
  mkdir $target/subdomains
  ./enumerator.sh $target $target/subdomains
else
  echo "Error: Directory already exists!";
  exit
fi


echo "Probing for Live Subdomains";
if [[ -f $target/subdomains/final_subdomains ]]
then
  ./prober.sh $target/subdomains
else
  echo "Error: No Subdomains Enumerated";
fi


echo "Template Scan";
if [[ -f $target/subdomains/live_subdomains ]]
then
  mkdir $target/templatescan
  ./templatescan.sh $target/subdomains $target/templatescan
else
  echo "Error: No live subdomains";
  exit
fi

echo "Wayback Endpoint";
mkdir $target/endpoints
./endpoints.sh $target $target/endpoints


echo "GF Pattern on Endpoints";
if [[ -f $target/endpoints/endpoints ]]
then
  mkdir $target/patternsearch
  ./patternsearch.sh $target/endpoints $target/patternsearch
else
  echo "Error: No Endpoints";
  exit
fi


echo "Vulnerability Scan on Pattern";
mkdir $target/vulnerability
./huntonpattern.sh $target/patternsearch $target/vulnerability

echo "Searching Directory";
mkdir $target/directory
./bruteforcer.sh $target/subdomains $target/directory


echo "Hunt for XSS";
mkdir $target/XSS
./huntXSS.sh $target/endpoints $target/XSS


echo "Screenshot Live Subdomains";
mkdir $target/screenshot
./screenshooter.sh $target/subdomains $target/screenshot
