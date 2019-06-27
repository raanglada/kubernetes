

# Steps

```
kubectl apply -f multi-container-deployment.yaml
kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
```

# How to access to containers in pods
kubectl exec -it <pod name> -c <cnotainer name>


# Clean
```
kubectl delete -f multi-container-deployment.yaml
kubectl delete -f nginx-deployment.yaml
kubectl delete -f nginx-service.yaml
```