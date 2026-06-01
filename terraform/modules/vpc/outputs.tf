output "network_id" {
  value       = yandex_vpc_network.terrnet.id
  description = "ID сети"
}

output "subnet_id" {
  value       = yandex_vpc_subnet.terrsubnet.id
  description = "ID публичной подсети"
}

output "sg_id" {
  value       = yandex_vpc_security_group.vm.id
  description = "ID SG публичной машины"
}
