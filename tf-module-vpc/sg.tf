resource "aws_security_group" "alb-sg" {
    name = "alb-sg"
    description = "Security Group for Application Load Balancer"
    vpc_id = aws_vpc.Mukta.id

    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = [var.VPC_CIDR]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name="alb-sg"
    }
  
}


resource "aws_security_group" "ec2-sg" {
    name = "ec2-sg"
    description = "Security Group for ec2 Instance"
    vpc_id = aws_vpc.Mukta.id

    ingress {
        from_port            = 0
        to_port              = 0
        protocol             = "-1"
        security_groups      = [aws_security_group.alb-sg.id]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name="ec2-sg"
    }
  
}