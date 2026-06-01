variable "project_name" {
  type        = string
  default     = "terr"
  description = "Префикс для всех ресурсов"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Окружение (dev, stage, prod)"
}

variable "zone" {
  type        = string
  default     = "ru-central1-d"
  description = "Зона доступности"
}

variable "ssh_public_key_path" {
  default = "~/.ssh/ssh-terr.pub"
}

variable "ssh_private_key_path" {
  default = "~/.ssh/ssh-terr"
}

variable "vm_user" {
  default = "ubuntu"
}