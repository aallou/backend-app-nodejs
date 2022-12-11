variable "project_id" {
  description = "The project ID to host the cluster in"
}

variable "region" {
  description = "The region to host the cluster in"
  default     = "europe-west1"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}