#!/bin/bash
sudo apt update
curl -LO https://github.com/skeema/skeema/releases/latest/download/skeema_amd64.deb
sudo apt install ./skeema_amd64.deb

sudo apt install awscli

sudo apt install mysql-client-core-8.0

mkdir agent
cd agent
wget https://vstsagentpackage.azureedge.net/agent/3.232.1/vsts-agent-linux-x64-3.232.1.tar.gz
tar zxvf *.gz
./config.sh --unattended --url https://jdbtech.visualstudio.com --auth pat --token mpitmek3exbonnvzrn6tk3d5nia7yi3udos3wy6bbkz3qw3ty6ya --pool JDBTECH --agent db-deploy --acceptTeeEula
sudo ./svc.sh install
sudo ./svc.sh start
