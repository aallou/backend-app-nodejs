# Datadog integration

## Pre-requisites
- Having a k8s cluster running on GKE
- Having the application (backend) running on the same k8s cluster
- Having Helm installed

## Install agent
```
helm install datadog -f agent_basic_values.yaml --set datadog.site='datadoghq.eu' --set datadog.apiKey='XXXX' datadog/datadog
```

The api key could be get from Datadog > https://app.datadoghq.eu/organization-settings/api-keys
