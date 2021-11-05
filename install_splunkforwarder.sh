#!/bin/sh 
 
 WGET_CMD="wget -O splunk-8.1.6-c1a0dd183ee5-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/8.1.6/linux/splunk-8.1.6-c1a0dd183ee5-Linux-x86_64.tgz"
 INSTALL_FILE="splunkforwarder-*"
 PASSWORD="Password123"


 cd /opt
 sudo yum install wget
 sudo $WGET_CMD
 sudo tar -xvzf $INSTALL_FILE
 sudo rm -rf $INSTALL_FILE

 sudo useradd -m -r splunk

 sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd $PASSWORD
 sudo /opt/splunkforwarder/bin/splunk stop -auth admin:$PASSWORD
 sudo chown -R splunk:splunk /opt/splunkforwarder
 sudo -u splunk /opt/splunkforwarder/bin/splunk restart
 sudo /opt/splunkforwarder/bin/splunk enable boot-start -user splunk
 
