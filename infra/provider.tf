# GCP provider

provider "google" {
    credentials = "${var.gcp_svc_key}"
    project = var.gcp_project
    region = var.gcp_region
}
