#!/bin/bash
#Chain all the tools to make automation

target=$1;

# ----------------------------------
# Colors
# ----------------------------------
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'




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

progress-bar 5

if [[ ! -d $target ]]
then
  mkdir $target

else
   echo "Error: Directory already exists!";
   exit 
fi

echo -e "\n";
echo "--------------------------------------------";
echo -e "${RED}Enumerating Subdomain${NOCOLOR}";
echo "--------------------------------------------";

if [[ ! -d $target/subdomains ]]
then
  mkdir $target/subdomains
  ./enumerator.sh $target $target/subdomains
else
  echo "Error: Directory already exists!";
  exit
fi


echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}Probing for Live Subdomains${NOCOLOR}";
echo "--------------------------------------------";

if [[ -f $target/subdomains/final_subdomains ]]
then
  ./prober.sh $target/subdomains
else
  echo "Error: No Subdomains Enumerated";
fi


echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}Template Scan${NOCOLOR}";
echo "--------------------------------------------";

if [[ -f $target/subdomains/live_subdomains ]]
then
  mkdir $target/templatescan
  ./templatescan.sh $target/subdomains $target/templatescan
else
  echo "Error: No live subdomains";
  exit
fi

echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}Wayback Endpoint${NOCOLOR}";
echo "--------------------------------------------";

mkdir $target/endpoints
./endpoints.sh $target $target/endpoints


echo -e "\n"; 
echo "----------------------------------------------------------------------";
echo -e "${RED}Seperate Endpoints Based on Vulnerable Parameter${NOCOLOR}";
echo "----------------------------------------------------------------------";

if [[ -f $target/endpoints/endpoints ]]
then
  mkdir $target/patternsearch
  ./patternsearch.sh $target/endpoints $target/patternsearch
else
  echo "Error: No Endpoints";
  exit
fi


echo -e "\n"; 
echo "------------------------------------------------------------";
echo -e "${RED}Scan Vulnerability on Vulnerable Pattern${NOCOLOR}";
echo "------------------------------------------------------------";

mkdir $target/vulnerability
./huntonpattern.sh $target/patternsearch $target/vulnerability

echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}Searching Directory${NOCOLOR}";
echo "--------------------------------------------";

mkdir $target/directory
./bruteforcer.sh $target/subdomains $target/directory


echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}XSS Hunt${NOCOLOR}";
echo "--------------------------------------------";

mkdir $target/XSS
./huntXSS.sh $target/endpoints $target/XSS


echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}Screenshot Subdomains${NOCOLOR}";
echo "--------------------------------------------";

mkdir $target/screenshot
./screenshooter.sh $target/subdomains $target/screenshot

echo -e "\n"; 
echo "--------------------------------------------";
echo -e "${RED}Stats${NOCOLOR}";
echo "--------------------------------------------";
./stats.sh $target
