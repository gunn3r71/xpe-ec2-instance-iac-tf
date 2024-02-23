variable "region" {
    type = string
    default = "us-east-1"
    nullable = false
    description = "Região onde seram provisionados os recursos"
}

variable "imageId" {
    type = string
    nullable = false
    description = "Imagem utilizada para criar instância EC2"
}

variable "key_name" {
    type = string
    nullable = false
}

variable "instance_type" {
  type = string
  nullable = false
  default = "t2.nano"
  description = "Tipo de instância EC2"
}

variable "vpc_id" {
  type = string
  nullable = false
  description = "Id de VPC"
}