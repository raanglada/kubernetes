#!/usr/bin/bash

#how to install helm
#curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh
#chmod u+x install-helm.sh
#mv to /usr/local/bin/helm

#configure and initiate
kubectl create serviceaccount --namespace kube-system tiller
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller --upgrade
helm update

