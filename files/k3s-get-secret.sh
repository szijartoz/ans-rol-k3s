#!/bin/bash
kubectl -n kubernetes-dashboard describe secret admin-user-token | grep '^token'
#kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
