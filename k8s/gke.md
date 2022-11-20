# Déployer une app sur GKE

## Pre-requis

### install gcloud cli : 
https://cloud.google.com/sdk/docs/install

### Check install
```
gcloud --version
```

### List des commandes : 
https://cloud.google.com/sdk/gcloud/reference

### lier gcloud à ton compte gmail + config
```
gcloud init # si déjà connecté avant, à ignorer

gcloud auth login
gcloud auth list
```

### set project (or create it)
```
gcloud projects create <PROJECT_ID> --name="PROJECT NAME"
gcloud config set project PROJECT_ID
```

### set compute region / zone : https://cloud.google.com/compute/docs/regions-zones
```
gcloud config set compute/region europe-west1
gcloud config set compute/zone europe-west1-b

gcloud config list
```
### Enable billing
```
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
```

## GKE part

### download kubectl (si besoin) : https://kubernetes.io/docs/tasks/tools/install-kubectl/
```
kubectl version --client
```

### Liste des clusters
```
gcloud container clusters list
```

```
gcloud container clusters create demo1-cluster --zone europe-west1-b
```

Le cluster crée :
  Cluster type: zonal
  Region: europe-west-1
  Zone: B
  Node count: 3 nodes, single-zone
  Autoscaling: off
  Instance type: n1-standard-1(CPU: 1; RAM: 3.75GB)
  Disk per node: 100GB

### description
```
gcloud container clusters describe demo1-cluster
```

### si nécessaire 
```
gcloud container clusters get-credentials <CLUSTER_NAME>
```

### liste des nodes
```
kubectl get nodes
```

### update config : 
```
gcloud container clusters update demo1-cluster \
  --enable-autoscaling \
  --node-pool default-pool \
  --zone europe-west1-b \
  --project training-devops-demo \
  --min-nodes 3 \
  --max-nodes 5
```

### create a deployment + pod
```
kubectl create deployment backend --image=aallou/backend-app-nodejs:v1
kubectl port-forward backend-65c76fd744-75l9c 9090:9090
```

Infos abour ingress :
The Ingress routes the traffic based on paths, domains, headers, etc.
A convenient feature from the Google Cloud Platform is that when you deploy a GKE cluster, the Ingress controller is automatically deployed.
Also, when you create an Ingress object, the GKE Ingress controller creates a Google Cloud HTTP(S) Load Balancer and configures it according to the information in the Ingress and its associated Services.
=> l'ingress controller est crée par défaut avec le cluster, quand un crée un objet ingress, ce controlleur crée un load balancer suivant les règles définis.

Pour plus d'info : https://kubernetes.io/docs/concepts/services-networking/ingress/

**PS :** nginx ingress on gke : https://cloud.google.com/community/tutorials/nginx-ingress-gke

### create an ip global
```
gcloud compute addresses create ingress-ip --global
gcloud compute addresses list
```

### use yaml files to deploy pods + service + ingress
```
k apply -f deployment.yml
k apply -f service.yml
k apply -f ingress.yml
```

### HPA
```
k apply -f deployment-hpa.yml
k set resources deployment/backend -c=app --limits=cpu=100m,memory=512Mi
```

wait for starting & check cpu used
```
k top pod <pod> --containers

k autoscale deployment backend --cpu-percent=50 --min=1 --max=10
# or : k apply -f hpa.yml
```
from your machine, launch a lot of requests using ab : 
```
ab -n 10000 -c 100 <ip or url>/users
```

### check : lancer chaque commande dans un terminal à part
```
k get pods -w
k top pod <pod> --containers
k get hpa -w
```
