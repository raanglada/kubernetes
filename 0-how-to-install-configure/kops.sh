#!/usr/bin/env bash

#dependencies
# sudo apt update
# sudo apt install python-pip curl -y
# pip install awscli
# aws --version

#install
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x ./kops
mv ./kops /usr/local/bin/

