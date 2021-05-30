#!/bin/bash

yum install -y java wget 
mkdir /opt/apm/ 

#Download wso2
wget  https://lab-tec.s3.amazonaws.com/wso2am-3.2.0.zip -O /opt/apm/wso2am-3.2.0.zip

#Download init script 
wget https://raw.githubusercontent.com/isweluiz/wso2/main/wso2 -O /etc/init.d/wso2
chmod +x /etc/init.d/wso2

#Download service 
wget https://raw.githubusercontent.com/isweluiz/wso2/main/wso2.service -O /etc/systemd/system/wso2.service
systemctl daemon-reload



cd /opt/apm/ 
unzip wso2am-3.2.0.zip
ln -s /opt/apm/wso2am-3.2.0 /opt/apm/wso2
useradd -r wso2
chown -R wso2:wso2 /opt/apm/
systemctl start wso2
