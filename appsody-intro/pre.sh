#mkdir -p ~/workspace/kabanero-workshop/nodejs && touch workspace/kabanero-workshop/nodejs/.env
#echo "PORT=9000" >> workspace/kabanero-workshop/nodejs/.env
#mkdir appsody-install
# cd ~
wget -P /root/appsody-install/ "https://github.com/appsody/appsody/releases/download/0.4.7/appsody_0.4.7_amd64.deb"
apt install -f /root/appsody-install/appsody_0.4.7_amd64.deb

