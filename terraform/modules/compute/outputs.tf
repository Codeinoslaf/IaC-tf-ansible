output "public_instance_ip" {
  description = "Готовые команды для подключения к серверам по SSH"
  # ключ - имя ВМ, значение - готовая команда
  value = {
    for key, instance in yandex_compute_instance.terr :
    key => "ssh -i ~/.ssh/ssh-terr ubuntu@${instance.network_interface[0].nat_ip_address}"
  }
}