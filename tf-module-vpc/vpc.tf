# Provision VPC

resource "aws_vpc" "Mukta" {

    cidr_block              = var.VPC_CIDR
    instance_tenancy        = "default"
    enable_dns_hostnames    = true
    tags = {
      Name="Mukta-VPC"
    }
  
}

