# FLASH - Web Application Penetration Testing and Reconnaisance Automation #

### Prerequisite ###
The user needs to have git installed in the system.

### Usage ###

_git clone https://github.com/kofhearts/flash.git_

In the same path make a new folder to keep tools.

_mkdir tools_

Altogether you will have two folders tools(empty directory) and flash (scripts)

Copy the autoDownloader.sh from the flash folder to the tools.

_cp flash/autoDownloader.sh tools/

Run the autoDownloader.sh which is found inside the tool directory to install all the necessary tools.

_./autoDownloader.sh_

Run main.sh with domain name.

_./main.sh example.com_

### Credits ###

The creators of the FLASH script do not take credit for any of the tools used and reserve no rights over the script. 
We would like to thank the creators of the various opensource tools used in this script. 
If any creators of used tools wish for the application to be removed from GitHub, 
please message KOfHearts. 

This script should only be used for educational purposes and not with malicious intent. 

The tools can be found at their respective locations as a direct file download or 
project repositories: (sequential order)

Go - open source programming language
https://golang.org/dl/go1.17.1.linux-amd64.tar.gz

SubFinder - a subdomain discovery tool that discovers valid subdomains for websites. 
https://github.com/projectdiscovery/subfinder

AssetFinder - Find domains and subdomains related to a given domain.
https://github.com/tomnomnom/assetfinder

ChaosClient - Analyses changes around DNS for better insights.
https://github.com/projectdiscovery/chaos-client

Amass - In-depth Attack Surface Mapping and Asset Discovery.
https://github.com/OWASP/Amass

Alt DNS - Generates permutations, alterations and mutations of subdomains and then resolves them.
https://github.com/infosec-au/altdns

HTTPX - Fast and multi-purpose HTTP toolkit that runs multiple probers using retryablehttp library.
https://github.com/projectdiscovery/httpx

Nuclei - Fast and customizable vulnerability scanner based on simple YAML based DSL.
https://github.com/projectdiscovery/nuclei

Wayback Machine - Fetch all the URLs that the Wayback Machine knows about for a domain.
github.com/tomnomnom/waybackurls

GF Patterns - Searches for (ssrf,RCE,Lfi,sqli,ssti,idor,url redirection,debug_logic, interesting Subs) parameters grep.
https://github.com/1ndianl33t/Gf-Patterns

QS Replace - Accept URLs on stdin, replace all query string values with a user-supplied value. 
https://github.com/tomnomnom/qsreplace

Dalfox - DalFox(Finder Of XSS) / Parameter Analysis and XSS Scanning tool based on golang.
https://github.com/hahwul/dalfox/

DirSearch - Web path scanner.
https://github.com/maurosoria/dirsearch.git

Param Spider - Mining parameters from dark corners of Web Archives.
https://github.com/devanshbatham/ParamSpider
