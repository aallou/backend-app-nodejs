# Terraform 

## Pre-requisites
- Install terraform : https://learn.hashicorp.com/tutorials/terraform/install-cli
- `gcloud init`
- `gcloud config set project PROJECT_ID`
- activate billing
```
gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
```
- `gcloud auth application-default login` -- add your account to the Application Default Credentials (ADC). This will allow Terraform to access these credentials to provision resources on GCloud.

You will see :
```
Credentials saved to file: [$HOME/.config/gcloud/application_default_credentials.json]

These credentials will be used by any library that requests Application Default Credentials (ADC).
```

## init
```
terraform init
```

=> check the folder : `ls -l`
(2 folder and 1 state file : terraform.tfstate)

## check if everything is ok
```
terraform validate
```

## plan
```
terraform plan
```

## apply
```
terraform apply
```

## configure kubectl
```
gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
```

## clean up
```
terraform destroy
```

## resources
- https://developer.hashicorp.com/terraform/tutorials/kubernetes/gke
- https://developer.hashicorp.com/terraform/tutorials/kubernetes/kubernetes-provider