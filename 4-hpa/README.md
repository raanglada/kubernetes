# Install metrics-server

- Clone the project 
```
git clone https://github.com/kubernetes-incubator/metrics-server.git
```

- Fix and hack according to 
https://github.com/kubernetes-incubator/metrics-server/issues/131
https://github.com/juan-vg/metrics-server/commit/264f9c551abdeedc575d36e74da40671c51cb747

Add the following lines in  deploy/1.8+/metrics-server-deployment.yaml

        command:
        - /metrics-server
        - --kubelet-insecure-tls
        - --kubelet-preferred-address-types=InternalIP

- install metrics-server
```
kubectl apply -f metrics-server/deploy/1.8+/
```

- Check metric server is working
```
kubectl top nodes
```

- test horizontal pod autoscaler

```
kubectl apply -f hpa1.yaml
```

- see the number of pods of target in the hpa is according to the minReplicas value


note: if metrics-server if not working the autoscaling won't work




