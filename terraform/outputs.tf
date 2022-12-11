output "cluster_name" {
  description = "Cluster name"
  value       = google_container_cluster.primary.name
}

output "region" {
  value       = var.region
  description = "GCloud Region"
}

output "kubernetes_cluster_host" {
  value       = google_container_cluster.primary.endpoint
  description = "GKE Cluster Host"
}