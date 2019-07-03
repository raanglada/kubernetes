#!/usr/bin/env bash

. env.sh

aws s3 cp $KOPS_STATE_STORE/config ~/.kube/config

unset KUBECONFIG
export KUBECONFIG=~/.kube/config


