resource "aws_instance" "Instance" {
    count = 2
    ami             =data.aws_ami.ami.id
    instance_type   = "t2.micro"
    subnet_id       ="${aws_subnet.subnet.*.id }"
    vpc_security_group_ids ="${aws_security_group.sg.id}"
    
    tags = {
      Name= "Instance-${count.index}"
    }

  
}