variable "project_name" {
  type        = string
  description = "Префикс проекта"
}

variable "environment" {
  type        = string
  description = "Окружение"
}

variable "zone" {
  type        = string
  default     = "ru-central1-d"
  description = "Зона доступности"
}

variable "subnet_id" {
  type        = string
  description = "ID подсети"
}

variable "sg_id" {
  type        = string
  description = "ID Security Group для машины"
}


variable "ssh_key_path" {
  type        = string
  default     = "~/.ssh/ssh-terr.pub"
  description = "Путь до публичного SSH-ключа (передаётся в метаданные ВМ)"
}