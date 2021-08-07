#!/bin/bash

echo "**** Get nodes"
kubectl get nodes

echo "**** Get all namespaces"
kubectl get pods --all-namespaces

