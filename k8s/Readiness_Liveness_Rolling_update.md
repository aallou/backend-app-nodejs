# Readiness & Liveness :

## Liveness
```
k apply -f deployment-liveness.yml
k get pods --watch # attendre 1min => restart

k exec -ti <pod> -- sh
touch /app/iam-live.txt

k describe pod <pod>
```

## Readiness
```
k apply -f deployment-readiness.yml
k get pods --watch # attendre 1min

k logs pods/backend-... --follow
```

## Rolling update
```
k apply -f deployment-rolling-update.yml # without readiness part
k get pods --watch # 3 pods running
```

Add readiness part and update file
```
k apply -f deployment-rolling-update.yml
k get pods --watch # 1 pod added but not ready
```

### affiche l'historique de changement de déploiement
```
k rollout history deployment/backend
```

### annuler le déploiement
```
k rollout undo deployment/backend
k get pods --watch
k rollout history deployment/backend
```

### correct the readiness and lancer ces commandes
```
k apply -f deployment-rolling-update.yml
k get pods --watch # 3 news pods added
k rollout history deployment/backend
```