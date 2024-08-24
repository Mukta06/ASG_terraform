resource "aws_instance" "Instance" {
    count                    = length(aws_subnet.subnet.*.id)
    ami                      = data.aws_ami.ami.id
    instance_type            = "t2.micro"
    subnet_id                = element(aws_subnet.subnet.*.id, count.index)
    #subnet_id               =element(aws_subnet.subnet.*.id, count.index)
    vpc_security_group_ids   = [aws_security_group.sg.id]
    iam_instance_profile     = "b57-admin-iam-role" 
    # user_data                = <<EOF

    #     #!/bin/bash
    #     echo "Use User Data To Deploy Code "
    # EOF 
    #user_data= file(<filename.sh>)
    
    tags = {
      Name= "Instance-${count.index+1}"
    }

  
}