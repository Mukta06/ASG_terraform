module "vpc" {
    source                  = "./tf-module-vpc"       # Terrafile clones the backend module mentioned in the Terrafile and keeps it local to the root 
    VPC_CIDR                = var.VPC_CIDR
    PUBLIC_SUBNET_CIDR      = var.PUBLIC_SUBNET_CIDR
    AZ                      = var.AZ
    DEFAULT_VPC_ID          = var.DEFAULT_VPC_ID
    DEFAULT_VPC_CIDR        = var.DEFAULT_VPC_CIDR
    DEFAULT_VPC_RT          = var.DEFAULT_VPC_RT
    
}
