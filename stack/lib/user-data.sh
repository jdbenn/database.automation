#!/bin/bash

sudo apt update
curl -LO https://github.com/skeema/skeema/releases/latest/download/skeema_amd64.deb
sudo apt install ./skeema_amd64.deb
sudo apt install -y awscli mysql-client-core-8.0
