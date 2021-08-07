#!/bin/bash

echo "**** Begin preparing dashboard"

echo "**** Install Kubernetes Dashboard"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta4/aio/deploy/recommended.yaml
nohup kubectl proxy --address='0.0.0.0' --port 8001 /dev/null &

kubectl create -f /etc/rancher/k3s/dashboard.admin-user.yaml -f /etc/rancher/k3s/dashboard.admin-user-role.yaml

echo "**** End preparing dashboard"
