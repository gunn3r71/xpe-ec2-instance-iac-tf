variable "region" {
    type = string
    default = "us-east-1"
    nullable = false
    description = "Região onde seram provisionados os recursos"
}

variable "image_id" {
    type = string
    nullable = false
    description = "Imagem utilizada para criar instância EC2"
    default = "ami-0ff8a91507f77f867"
}

variable "key_name" {
    type = string
    nullable = false
    description = "Chave de acesso SSH"
    default = "xpe-ec2-server"
}

variable "instance_type" {
  type = string
  nullable = false
  default = "t3a.small"
  description = "Tipo de instância EC2"
}

variable "vpc_id" {
  type = string
  nullable = false
  description = "Id de VPC"
}

variable "tags_propagation" {
  type = map(string)
  nullable = true
  default = {
    Course = "XPe AWS"
    Env = "Study"
  }
  description = "Tags a serem propagadas"
}