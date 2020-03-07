#!/usr/bin/env bash

set -eu

# add repo Docker-CE
apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# add repo Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF


#install docker
apt-get update 
apt-get install -y docker-ce docker-ce-cli containerd.io

# install kubernets
apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

echo "KUBELET_EXTRA_ARGS=--node-ip=${PRIVATE_IP}" > /etc/default/kubelet 
systemctl daemon-reload
systemctl restart kubelet
