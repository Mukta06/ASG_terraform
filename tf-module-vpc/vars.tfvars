# Declaring Variables


VPC_CIDR              = "17.1.0.0/25"
PUBLIC_SUBNET_CIDR    =["17.1.0.0/26" , "17.1.0.64/26"]
AZ                    =["us-east-1a" , "us-east-1b"]
DEFAULT_VPC_ID        = "vpc-006d8a30439e4cd0f"
DEFAULT_VPC_CIDR      = "172.31.0.0/16"
DEFAULT_VPC_RT        ="rtb-0b72155946424b61b"
NAME_REGEX            ="DevOps-LabImage-Centos-8"
OWNER                 = ["355449129696"]
INSTANCE_TYPE         = "t2.micro"
SECURITY_GROUP_ID     ="${aws_security_group.sg.id}"








