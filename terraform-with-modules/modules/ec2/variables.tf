variable "imageId" {
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

variable "shutdown" {
    type = bool
    default = false
    description = "Define se uma instância pode ou não ser desligada"
}

variable "tags_propagation" {
    type = map(string)
    default = {
    }
    description = "Tags a serem propagadas"
}