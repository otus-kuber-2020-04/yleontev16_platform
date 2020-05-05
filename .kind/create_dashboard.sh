#!/bin/bash

SCRIPT_WORKING_DIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "[+] Script working dir is [$SCRIPT_WORKING_DIR]"
cd "$SCRIPT_WORKING_DIR"

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
kubectl apply -f dashboard-sa.yaml
kubectl apply -f dashboard-crb.yaml

kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep admin-user | awk '{print $1}') > token.info

