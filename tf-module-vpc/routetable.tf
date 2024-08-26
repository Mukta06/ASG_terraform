# Provisioning Route Table and its Association with Subnets

resource "aws_route_table" "routeTable" {
    vpc_id = aws_vpc.Mukta.id

    route{
        cidr_block   = "0.0.0.0/0"
        gateway_id   = aws_internet_gateway.IGW-VPC.id  
    }

    route{
        cidr_block                  = var.DEFAULT_VPC_CIDR
        vpc_peering_connection_id   = aws_vpc_peering_connection.peer.id
          
    }

    tags = {
      Name= "Mukta-routeTable"
    }
  
}

resource "aws_route_table_association" "subnet_rt_association" {
    count           = length (aws_subnet.subnet.*.id)
    subnet_id       = element(aws_subnet.subnet.*.id , count.index)
    route_table_id  = aws_route_table.routeTable.id

  
}