# Introduction
In this repo you will find basic examples to start with Kubernetes. You will fin also basic bash script to install tools like kops and kubectl. A very basic Jenkinsfile pipeline was added if you want to integrate the examples with a ci/cd process.

# Content
- 0-how-to-install-configure: you will find basic bash scripts to install and configure tools like helm, kops. kubectl and others

- 1-pods-depoloys: examples of pods and deploys

- 2-ingress: examples of nginx ingress

- 3-pv-pvc: examples of persistent volumes and persistent volumes claims

- 4-hpa: example of Horizontal Pod Autoscaler(HPA)

- 5-cluster-autoscaler: a guide to test cluster autoscaler over AWS.

# Kops and kubeconfig
- after you installed your cluster with kops you can use the kube config file generated to enter to the cluster from another point
- to manage the cluste from another machine you need:
- - the yaml config file generated by default in ~/.kube/config
- - the name of the clster and the name bucket were kops stored the state of the cluster
```
bucket_name=bucket-for-kops-2
cluster_name=test.k8s.local
```
- - se the corresponding environment variables, examples:
```
export KOPS_CLUSTER_NAME=$cluster_name
export KOPS_STATE_STORE=s3://${bucket_name}
```
 




