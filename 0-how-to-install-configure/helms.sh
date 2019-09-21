#!/usr/bin/bash

#how to install helm
curl -L https://git.io/get_helm.sh | bash
helm init
helm update

#configure and initiate
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --upgrade
helm update

