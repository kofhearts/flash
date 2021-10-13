#! /bin/sh
echo "Download and Install Go!";
wget https://golang.org/dl/go1.17.1.linux-amd64.tar.gz
tar -xzvf go1.17.1.linux-amd64.tar.gz
sudo cp go/bin/go /usr/local/bin
rm go1.17.1.linux-amd64.tar.gz
echo "Installing Subdinfer \n";
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest


echo "Subfinder";
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.9/subfinder_2.4.9_linux_amd64.zip
unzip subfinder_2.4.9_linux_amd64.zip
mv subfinder /usr/local/bin/
rm -f subfinder_2.4.9_linux_amd64.zip

echo "assetfinder";
wget https://github.com/tomnomnom/assetfinder/releases/download/v0.1.0/assetfinder-linux-amd64-0.1.0.tgz
tar zxvf assetfinder-linux-amd64-0.1.0.tgz 
mv /usr/local/bin
rm -f assetfinder-linux-amd64-0.1.0.tgz 

echo "chaos";
GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos
mv /root/go/bin/chaos /usr/local/bin

echo "Amass installing...";
go get -v github.com/OWASP/Amass/v3/...
cp /root/go/bin/amass /usr/local/bin
