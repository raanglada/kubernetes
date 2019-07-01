# Steps for testing

```
kubectl apply -f pv1.yaml
kubectl apply -f pvc.yaml
kubectl apply -f nginx-stateful.yaml
```

## Check that services and pods are running

```
kubectl get pods,svc
```

## Save data in the persistent volume and check the data persist even if pods crashed

- Find the node were the pod is executing and find de host path specified in hostPath atributte in pv1.yaml. 
```
ssh user@node-cluster

```
- Write and index.html with some test content
```
echo "testing pvc pv in k8s cluster" >> /mnt/data/index.html
```
- Test you get this responde from nginx
```
curl nodeip
```
- Delete the pod created. k8s will create it again
```
kubectl delete pods podid
```
- Check a enw pod was created and enter to any node and check that you still see the test content









