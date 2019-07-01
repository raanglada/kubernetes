#!/usr/bin/bash
#you need helm installed and configured with your cluster

helm install stable/nginx-ingress --name my-nginx-ingress --set rbac.create=true

