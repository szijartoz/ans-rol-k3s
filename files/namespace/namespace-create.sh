#!/bin/sh
cd /root
kubectl create -f namespace-test.yaml
kubectl create -f namespace-development.yaml
kubectl create -f namespace-production.yaml
kubectl get namespaces --show-labels
