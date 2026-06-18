resource "google_compute_network" "this" {
  count = var.create_network ? 1 : 0

  name                    = var.name
  project                 = var.project_id
  auto_create_subnetworks = var.auto_create_subnetworks
}
