# Creating Launch Templete for EC2 Instance

resource "aws_launch_template" "launch-template-ec2" {
    name = "launch-template-ec2"
    image_id = var.AMI_ID
    instance_type = var.INSTANCE_TYPE
    user_data = filebase64 ("user-data.sh")

    network_interfaces {
       security_groups = [ aws_security_group.ec2-sg.id]

    }

    

    tag_specifications {
      resource_type = "instance"
      tags = {
        Name="launch-template-ec2"
      }
    }
  
}

#Creating AutoScaling Group

resource "aws_autoscaling_group" "ec2-asg" {
    max_size = 5
    min_size = 2
    desired_capacity = 2
    name = "ec2-asg"
    target_group_arns = [ aws_lb_target_group.alb-ec2-tg.arn]
    vpc_zone_identifier = aws_subnet.subnet[*].id

    launch_template {
      id = aws_launch_template.launch-template-ec2.id
      version = "$Latest"
    }

    health_check_type ="EC2"
}










































