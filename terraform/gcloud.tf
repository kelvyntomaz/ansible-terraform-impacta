provider "google" {
  credentials = "${file ("/home/vagrant/chave-gcloud.json")}"
  project = "iron-atom-193017"
  region = "us-east1"
}

resource "google_storage_bucket" "image_storage-gcloud" {
  name = "impacta-kelvyn-michell-gcloud"
  location = "EU"

}

resource "google_compute_instance" "machine-gcloud" {
  name = "machine-kelvyn-michell-gcloud"
  machine_type = "f1-micro"
  zone = "us-east1-b"

  boot_disk {
    device_name = "machine_disk1"
    auto_delete = "true"
    initialize_params {
      size = 50
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = "default"
  }
}
