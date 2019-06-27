#!/usr/bin/bash

#aws configure
#or instance profile in the EC2

#vars
bucket_name=bucket-for-kops
cluster_name=test.k8s.local

#s3 confs
#aws s3 mb s3://#bucket_name
#aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled

#kops env vars
export KOPS_CLUSTER_NAME=$cluster_name
export KOPS_STATE_STORE=s3://${bucket_name}

#generate key
#ssh-keygen -t rsa -b 4096 -C "test@test.com"

kops create cluster \
--master-size=t2.medium \
--node-count=2 \
--node-size=t2.medium \
--zones=us-east-1a \
--name=${KOPS_CLUSTER_NAME}

kops create secret --name $cluster_name sshpublickey admin -i ~/.ssh/id_rsa.pub

kops update cluster --name ${KOPS_CLUSTER_NAME} --yes

#check if cluster is ready
kops validate cluster





