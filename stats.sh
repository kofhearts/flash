#!/bin/bash

target=$1

echo -e "File\t\t\tFilePath";
echo -e "Found Directories\t${target}->directory->output";
echo -e "Found Endpoints\t${target}->Endpoints->Wayback,Paramspider";
echo -e "Pattern Search\t${target}->Patternsearch->xss,sqli,openredirect";
echo -e "Screenshot Subdomains\t${target}->screenshot->output";
echo -e "Found Subdomains\t${target}->subdomains->live_subdomains";
echo -e "Template Scan\t${target}->templatescan->Vulnerabilities";
echo -e "Vulnerability\t${target}->Vulnerability->Vulnerability on Pattern";
echo -e "XSS\t${target}->directory->xss_potential";







