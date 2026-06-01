output "connect_to_vms" {
  value       = module.compute.public_instance_ip
  description = "Готовые команды для подключения к серверам по SSH"
}