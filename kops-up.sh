#!/usr/bin/env bash

# #aws configure
# #or instance profile in the EC2

. env.sh

#s3 confs
#aws s3 mb s3://$bucket_name
aws s3api put-bucket-versioning --bucket ${bucket_name} --versioning-configuration Status=Enabled

#generate key
rm -rf ~/.ssh/id_rsa
ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

kops create cluster \
--master-size=${master_size} \
--node-count=${workers_count} \
--node-size=${workers_size} \
--zones=${aviablity_zone} \
--name=${KOPS_CLUSTER_NAME}

kops create secret --name $cluster_name sshpublickey admin -i ~/.ssh/id_rsa.pub

kops update cluster --name ${KOPS_CLUSTER_NAME} --yes

aws s3 cp ~/.ssh/id_rsa $KOPS_STATE_STORE

#check if cluster is ready
#kops validate cluster





