resource "yandex_vpc_network" "terrnet" {
  name = "${var.project_name}-${var.environment}-net"
}

resource "yandex_vpc_subnet" "terrsubnet" {
  name           = "${var.project_name}-${var.environment}-subnet"
  network_id     = yandex_vpc_network.terrnet.id
  v4_cidr_blocks = ["10.5.1.0/24"]
  zone           = var.zone
}

resource "yandex_vpc_security_group" "vm" {
  name       = "${var.project_name}-${var.environment}-sg"
  network_id = yandex_vpc_network.terrnet.id

  ingress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
    description    = "Allow all"
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
    description    = "Allow all"
  }
}