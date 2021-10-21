#! /bin/sh
#Downloading and Installing Required Tools for the automation script.

echo "Download and Install Go!";
wget https://golang.org/dl/go1.17.2.linux-amd64.tar.gz
tar -xzvf go1.17.2.linux-amd64.tar.gz
sudo cp go/bin/go /usr/local/bin
rm go1.17.2.linux-amd64.tar.gz

echo "Subfinder";
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.9/subfinder_2.4.9_linux_amd64.zip
unzip subfinder_2.4.9_linux_amd64.zip
sudo mv subfinder /usr/local/bin/
rm -f subfinder_2.4.9_linux_amd64.zip

echo "assetfinder";
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz
tar zxvf assetfinder-linux-amd64-0.1.0.tgz 
mv assetfinder /usr/local/bin
rm -f assetfinder-linux-amd64-0.1.0.tgz 


echo "Amass";
go get -v github.com/OWASP/Amass/v3/...
sudo cp /root/go/bin/amass /usr/local/bin


echo "httpx"
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo cp /root/go/bin/httpx /usr/local/bin

echo "nuclei"
GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei
sudo cp /root/go/bin/nuclei /usr/local/bin

echo "Wayback machine"
go get github.com/tomnomnom/waybackurls
sudo cp /root/go/bin/waybackurls /usr/local/bin

echo "GF pattern"
go get -u github.com/tomnomnom/gf
sudo cp ~/go/bin/gf /usr/local/bin
mkdir ~/.gf
git clone https://github.com/1ndianl33t/Gf-Patterns ~/tools/Gf-Patterns
mv ~/tools/Gf-Patterns/*.json ~/.gf/
rm -r ~/tools/Gf-Patterns;


echo "QS replace"
go get -u github.com/tomnomnom/qsreplace
sudo cp ~/go/bin/qsreplace /usr/local/bin

echo "Dalfox"
go install github.com/hahwul/dalfox/v2@latest
sudo cp ~/go/bin/dalfox /usr/local/bin

echo "Dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
pip3 install -r dirsearch/requirements.txt

echo "Param Spider"
git clone https://github.com/devanshbatham/ParamSpider
pip3 install -r ParamSpider/requirements.txt
cd ~/.gf; wget https://raw.githubusercontent.com/devanshbatham/ParamSpider/master/gf_profiles/potential.json;
