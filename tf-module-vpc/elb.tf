# This provisions Application load balancer

#Creating Load Balancer
resource "aws_lb" "app-lb" {
    name = "app-lb"
    load_balancer_type = "application"
    internal = false
    security_groups = [ aws_security_group.alb-sg.id ]
    subnets = aws_subnet.subnet[*].id
    depends_on = [ aws_internet_gateway.IGW-VPC]
  
}

# Creating Target Groups for LoadBalancer

resource "aws_lb_target_group" "alb-ec2-tg" {

    name = "alb-ec2-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.Mukta.id
    tags = {
      Name="alb-ec2-tg"
    }
  
}

# Creating Listerners for LoadBalancer

resource "aws_lb_listener" "app-lb-listener" {
    load_balancer_arn = aws_lb.app-lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      type = "forward"
      target_group_arn = aws_lb_target_group.alb-ec2-tg.arn
    }
    tags = {
      Name="app-lb-listener"
    }
  
}