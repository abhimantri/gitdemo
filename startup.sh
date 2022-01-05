## to get version of a openssh  into a text file

apt-get install -y openssh-client openssh-server
touch version.txt
chmod +wx version.txt
ssh -V | version.txt


