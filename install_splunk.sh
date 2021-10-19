#!/bin/sh

 WGET_CMD="wget -O splunk-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz https://d7wz6hmoaavd0.cloudfront.net/products/splunk/releases/8.2.2.1/linux/splunk-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz"
 INSTALL_FILE="splunk-*"
 PASSWORD="Password123"


 cd /opt
 sudo yum install wget
 sudo $WGET_CMD
 sudo tar -xzf $INSTALL_FILE
 sudo rm -rf $INSTALL_FILE

 sudo useradd -m -r splunk

 sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd $PASSWORD
 sudo /opt/splunk/bin/splunk stop -auth admin:$PASSWORD
 sudo chown -R splunk:splunk /opt/splunk
 sudo -u splunk /opt/splunk/bin/splunk restart
 sudo /opt/splunk/bin/splunk enable boot-start -user splunk
 

