#!/bin/bash
sudo apt update
curl -LO https://github.com/skeema/skeema/releases/latest/download/skeema_amd64.deb
sudo apt install ./skeema_amd64.deb


sudo apt install mysql-client-core-8.0

mkdir agent
cd agent
wget https://vstsagentpackage.azureedge.net/agent/3.232.1/vsts-agent-linux-x64-3.232.1.tar.gz
tar zxvf *.gz
./config.sh --unattended --url https://jdbtech.visualstudio.com --auth pat --token xtzere6ouhuy3e4euwhkkenm4sje4bh4vj46pamg7cumigctglla --pool JDBTECH --agent db-deploy --acceptTeeEula
sudo ./svc.sh install
sudo ./svc.sh
