#!/bin/sh

ACCOUNTS="jenkins itadmin"
for account in $ACCOUNTS
do
kubectl get serviceaccounts $account -o yaml
done
