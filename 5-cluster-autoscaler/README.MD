
- define a cluster with kops. create and don't update yet

- edit the instances group defined by kops

```
kops edit ig nodes
```

- the following snipped of code is an example, adjust your minSize and maxSize, your clustername

```
spec:
  cloudLabels:
    k8s.io/cluster-autoscaler/<CLUSTERNAME>: ""
    k8s.io/cluster-autoscaler/enabled: ""
    k8s.io/cluster-autoscaler/node-template/label: ""
    kubernetes.io/cluster/<CLUSTERNAME>: owned
  ...
  minSize: 5
  maxSize: 10
```

- edit cluster definition

```
kops edit cluster

```

```
...
kind: Cluster
spec:
  additionalPolicies:
    node: |
      [
        {
          "Effect": "Allow",
          "Action": [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeTags",
            "autoscaling:TerminateInstanceInAutoScalingGroup"
          ],
          "Resource": ["*"]
        }
      ]
...
```

- update cluster(install it...)
```
kops update cluster --yes
```


- install helm


- install cluster autoscaler

substitute <CLUSTERNAME>

```
helm install --name cluster-autoscaler \
 --namespace kube-system \
 --set image.tag=v1.12.0 \
 --set autoDiscovery.clusterName=<CLUSTERNAME> \
 --set extraArgs.balance-similar-node-groups=false \
 --set extraArgs.expander=random \
 --set rbac.create=true \
 --set rbac.pspEnabled=true \
 --set awsRegion=us-east-1 \
 --set nodeSelector."node-role\.kubernetes\.io/master"="" \
 --set tolerations[0].effect=NoSchedule \
 --set tolerations[0].key=node-role.kubernetes.io/master \
 --set cloudProvider=aws \
 stable/cluster-autoscaler
```

- test the autoscaler
kubectl run nginx --image=nginx --port=80 --replicas=200



- clean 
```
kubectl delete deployment nginx
```

reference: https://github.com/kubernetes/autoscaler/tree/master/cluster-autoscaler

