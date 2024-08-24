# resource "aws_instance" "Instance" {
#     count                    = length(aws_subnet.subnet.*.id)
#     ami                      = data.aws_ami.ami.id
#     instance_type            = "t2.micro"
#     subnet_id                = element(aws_subnet.subnet.*.id, count.index)
#     #subnet_id               =element(aws_subnet.subnet.*.id, count.index)
#     vpc_security_group_ids   = [aws_security_group.sg.id]
#     iam_instance_profile     = "b57-admin-iam-role" 
#     # user_data                = <<EOF

#     #     #!/bin/bash
#     #     echo "Use User Data To Deploy Code "
#     # EOF 
#     #user_data= file(<filename.sh>)
    
#     tags = {
#       Name= "Instance-${count.index+1}"
#     }

  
# }

#Creating Instances with AutoScaling upto 5

resource "aws_launch_template" "template" {
    name_prefix                 ="From-Template"
    image_id                    =data.aws_ami.ami.id
    instance_type               =var.INSTANCE_TYPE
    security_group_names        =[aws_security_group.sg.id]
    
    
  
}

resource "aws_autoscaling_group" "autoscale" {
    count                 = length(var.AZ)
    name                  = "Auto-Scaling"
    availability_zones    = element(var.AZ, count.index)
    desired_capacity      = 1
    max_size              = 5
    min_size              = 1
    health_check_type     = "EC2"
    vpc_zone_identifier   = element(aws_subnet.subnet.*.id , count.index)

    launch_template {
      id = aws_launch_template.template.id
    }
  
}