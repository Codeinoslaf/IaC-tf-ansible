data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "terr" {
  for_each = toset(["first", "second"])

  name        = "${var.project_name}-${var.environment}-${each.key}"
  hostname    = "${var.project_name}-${var.environment}-${each.key}"
  platform_id = "standard-v2"
  zone        = var.zone

  scheduling_policy {
    preemptible = true
  }

  resources {
    core_fraction = 5
    cores         = 2
    memory        = 1
  }

  boot_disk {
    initialize_params {
      type     = "network-hdd"
      image_id = data.yandex_compute_image.ubuntu.id
      size     = 10
      name     = "disk-${each.key}" 
    }
  }

  network_interface {
    subnet_id          = var.subnet_id
    nat                = true 
    security_group_ids = [var.sg_id]
  }

  metadata = {
    ssh-keys  = "ubuntu:${file(var.ssh_key_path)}"
  }
}

resource "local_file" "ansible_inventory" {
  content = <<-EOT
    [common_nodes]
    ${yandex_compute_instance.terr["first"].network_interface[0].nat_ip_address} ansible_user=${var.vm_user} ansible_ssh_private_key_file=${var.ssh_private_key_path}

    [nginx_nodes]
    ${yandex_compute_instance.terr["second"].network_interface[0].nat_ip_address} ansible_user=${var.vm_user} ansible_ssh_private_key_file=${var.ssh_private_key_path}
  EOT
  
  filename = "${path.root}/../ansible/inventory.ini"
}