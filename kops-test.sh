#!/usr/bin/env bash

#aws configure
#or instance profile in the EC2

#vars
bucket_name=bucket-for-kops-2
cluster_name=test.k8s.local
master_size=t2.medium
workers_count=2
workers_size=t2.medium
aviablity_zone=us-east-1a

#s3 confs
#aws s3 mb s3://$bucket_name
aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled

#kops env vars
export KOPS_CLUSTER_NAME=$cluster_name
export KOPS_STATE_STORE=s3://${bucket_name}

#generate key
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

kops create cluster \
--master-size=${master_size} \
--node-count=${workers_count} \
--node-size=${workers_size} \
--zones=${aviablity_zone} \
--name=${KOPS_CLUSTER_NAME}

kops create secret --name $cluster_name sshpublickey admin -i ~/.ssh/id_rsa.pub

kops update cluster --name ${KOPS_CLUSTER_NAME} --yes

#check if cluster is ready
#kops validate cluster





