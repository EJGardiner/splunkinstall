#!/bin/sh 
 
 WGET_CMD="wget -O splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz https://download.splunk.com/products/universalforwarder/releases/8.2.2.1/linux/splunkforwarder-8.2.2.1-ae6821b7c64b-Linux-x86_64.tgz"
 INSTALL_FILE="splunkforwarder-*"
 PASSWORD="Password123"


 cd /opt
 sudo yum install wget
 sudo $WGET_CMD
 sudo tar -xzf $INSTALL_FILE
 sudo rm -rf $INSTALL_FILE

 sudo useradd -m -r splunk

 sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd $PASSWORD
 sudo /opt/splunkforwarder/bin/splunk stop -auth admin:$PASSWORD
 sudo chown -R splunk:splunk /opt/splunkforwarder
 sudo -u splunk /opt/splunkforwarder/bin/splunk restart
 sudo /opt/splunkforwarder/bin/splunk enable boot-start -user splunk
 
