terraform {
  backend "s3" {
    bucket = "b57-mukta-tf-state-bucket"
    key = "dev/ASG/terraform.tfstate"
    region="us-east-1"
    #dynamodb_table = "terraform-locking"
    
  }