# Les commandes de base pour se familiariser avec kubectl

1. clone & test
git@github.com:aallou/backend-app-nodejs.git

2. Pour avoir un cluster k8s prêt à l'emploi : 
- go to https://killercoda.com/kubernetes/scenario/a-playground

# commandes

### Lancer un déploiement en se basant sur une image (inline)  
``` 
# before k8s 1.8 :
kubectl run <deployment_name> --image=<image> -- <commande>
```

```
kubectl create deployment backend --image=aallou/backend-app-nodejs:v1
```

### S’assurer que le deployment est crée  :
```
kubectl get deployments
kubectl get pods
kubectl logs <pod_name>
```

### se connecter au pod :
```
kubectl exec -ti <pod_name> -- <commande>
kubectl exec -ti <pod_name> -- sh
```

### Détail du pod
```
kubectl describe pods/<pod_name>
```

### Pour voir la liste des pods avec leurs ips : 
```
kubectl get pods -o wide
```

### appel api
```
curl <ip_pod>:9090/users
```

### Supprimons un pod, et voir ce qui se passe :
```
kubectl delete pods/<pod_name>
kubectl get pods
```

### Scaller :
```
kubectl scale deployments/<dep_name> --replicas=3
kubectl get pods
```

### expose le service
```
kubectl expose deployments/backend --port=9090
```

### check
```
kubectl get service
```

### executer qlq reqs et  voir les logs
```
curl <service_ip>:9090/users
kubectl logs -l app=backend --prefix=true --follow=true
```

### get deployment sous forme de yaml 
```
kubectl get deployments/backend -o yaml > deployment-backend.yml
kubectl delete deployments/backend
kubectl apply -f deployment-backend.yml

kubectl get svc/backend -o yaml > backend-svc.yaml
kubectl delete svc/backend
kubectl apply -f backend-svc.yaml
```

**Bonus :** 
- kubectl commands : https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#create
- pour ne pas taper à chaque kubectl, créer un alias : `alias k="kubectl"`
