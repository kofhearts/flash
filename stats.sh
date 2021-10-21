#!/bin/bash
#List of files generated and where it can be found
target=$1

echo -e "File\t\t\t\t\tFilePath";
echo -e "Found Directories\t\t${target}->directory->output";
echo -e "Found Endpoints\t\t\t${target}->Endpoints->Wayback,Paramspider";
echo -e "Pattern Search\t\t\t${target}->Patternsearch->xss,sqli,openredirect";
echo -e "Screenshot Subdomains\t\t${target}->screenshot->output";
echo -e "Found Subdomains\t\t${target}->subdomains->live_subdomains";
echo -e "Template Scan\t\t\t${target}->templatescan->Vulnerabilities";
echo -e "Vulnerability\t\t\t${target}->Vulnerability->Vulnerability on Pattern";
echo -e "XSS\t\t\t\t${target}->directory->xss_potential";







