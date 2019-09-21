# Install nginx-ingress controller with helm

```
helm install stable/nginx-ingress --name nginx-test
```

# Test
```
kubectl apply -f apple-deploy.yaml
kubectl apply -f banana-deploy.yaml
kubectl apply -f apple-Service.yaml
kubectl apply -f banana-Service.yaml
kubectl apply -f ingress1.yaml
kubectl apply -f ingress2.yaml

```

# Brief explanation
- The ingress controller implements the concept of routing applying rules
- You have in the example to services running: apple and banana
- In ingress1.yaml lets you route by path
- In ingress2.yaml lets you route by domain and path
    - In this example, after you have installed ingress, take the domain name of the ingress created(it's a classic load balancer in AWS), 
    - Do an nslookup and map the ip in the /etc/host, then test with curl





