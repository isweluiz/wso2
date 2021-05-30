#!/bin/bash
echo "Desinstalando WSO2..."
killPID=`ps aux | grep wso2 | grep -v grep | awk '{print $2}' | xargs kill -9`
echo "Eliminando processos..."
$killPID 
echo "Removendo arquivos e configurações..."
rm -rf /etc/init.d/wso2 /etc/systemd/system/wso2.service /opt/apm/ 
echo "Deletando usuário..."
userdel wso2
echo "Desinstalação completa."
