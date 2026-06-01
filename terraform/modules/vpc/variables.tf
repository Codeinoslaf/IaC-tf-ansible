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
