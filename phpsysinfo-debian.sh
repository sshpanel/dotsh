!#/bin/sh

#################################################
#     Server Configuration for Debian Final     #
#              Don't use port 8080              #     
#################################################

## install sudo
apt-get install sudo

## updating packages
sudo apt-get update -y
sudo apt-get upgrade -y

## installing dependencies
sudo apt-get install unzip -y
sudo apt-get install nano -y
sudo apt-get install sed -y
sudo apt-get install screen -y

## installing HTTP Server (Powered By Apache)
sudo apt-get install apache2 -y

## starting HTTP Services
sudo service apache2 start

## fix for hostname resolving
echo "ServerName	localhost" >> /etc/apache2/apache2.conf

## install PHP5
sudo apt-get install php5 php5-common php5-xml libapache2-mod-php5 libapache2-mod-php php-xml -y

## change to port 7071
echo "Listen	8080" >> /etc/apache2/apache2.conf

##restarting HTTP Services
sudo service apache2 restart

## downloading phpsysinfo
cd /var/www
rm -R *
mkdir html
wget https://github.com/phpsysinfo/phpsysinfo/archive/master.zip
unzip master.zip
mv phpsysinfo-master/phpsysinfo.ini.new phpsysinfo-master/phpsysinfo.ini
cp -r phpsysinfo-master/* .
cp -r phpsysinfo-master/* html


## finishing installation
sudo service apache2 restart
