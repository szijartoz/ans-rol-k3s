#!/bin/bash

cd /root

kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/deploy/local-path-storage.yaml
kubectl get storageclass

## Init kube
kubectl create -f k3s-helm-rbac-config.yaml

#download helm
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh
chmod u+x install-helm.sh
./install-helm.sh
###curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

helm init --service-account=tiller --history-max 200

#KUBECONFIG=/etc/rancher/k3s/k3s.yaml helm init --history-max 10  --tiller-image jessestuart/tiller --service-account tiller
exit

echo "**** Begin preparing helm k3s"
#Create tiller service account
#Create cluster role binding for tiller
#Initialize tiller
kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
KUBECONFIG=/etc/rancher/k3s/k3s.yaml helm init --history-max 10  --tiller-image jessestuart/tiller
echo "**** End preparing helm k3s"
exit


#kubectl create serviceaccount --namespace kube-system tiller
#kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
KUBECONFIG=/etc/rancher/k3s/k3s.yaml helm init --history-max 10 --service-account tiller
#KUBECONFIG=/etc/rancher/k3s/k3s.yaml helm init --history-max 10 --service-account default
