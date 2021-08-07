#!/bin/bash

echo "**** Begin installing k3s"

#Install
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.0.1 K3S_KUBECONFIG_MODE="644" sh -

#curl -sfL https://get.k3s.io | K3S_URL=https://myserver:6443 K3S_TOKEN=mynodetoken sh -

echo "**** End installing k3s"
