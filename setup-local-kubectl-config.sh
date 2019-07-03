#!/usr/bin/env bash

. env.sh

aws s3 cp s3://KOPS_STATE_STORE/config ~/.kube/config



