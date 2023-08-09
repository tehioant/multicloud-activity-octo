resource "google_storage_bucket" "storage_altribes" {
  name          = "alltribes-bucket"
  public_access_prevention = "enforced"
  location = "EU"
}