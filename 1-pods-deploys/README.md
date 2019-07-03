# Test

```
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

## To test nginx installed:
```
kubectl get svc
```

- copy the ip of the service
- ssh to one node the cluster
- curl http://ip-of-the-service


If you want to enter to the container
```
kubectl get pods
```
- take de id of the pod
- kubectl exec -it pod-id bash
- if you have more than one container in a pod use -c container-name

# Testing a pod with more than one container
kubectl apply -f multi-container-deployment.yaml

Entering to a container in this pod
```
kubectl get pods
```
- take the id of the pod
- enter to the specific container
```
kubectl exec -it pod-id -c nginx
```




