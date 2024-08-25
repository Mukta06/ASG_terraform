# Provisioning Subnets in two different regions

resource "aws_subnet" "subnet" {
    count                    =length(var.PUBLIC_SUBNET_CIDR)
    vpc_id                   =aws_vpc.Mukta.id
    cidr_block               =element(var.PUBLIC_SUBNET_CIDR, count.index)
    availability_zone        = element(var.AZ, count.index)element(var.AZ, count.index)
    map_public_ip_on_launch  = true
    tags = {
      Name="public_subnet- ${count.index+1}"
    }
  
}