# This Provisions Internet GateWay and attach it to VPC

resource "aws_internet_gateway" "IGW-VPC" {
    vpc_id = aws_vpc.Mukta.id
    tags={
        Name= "Mukta-IGW"
    }
  
}