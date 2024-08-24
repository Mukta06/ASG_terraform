data "aws_ami" "ami" {
  most_recent      = true
  name_regex       = var.NAME_REGEX
  owners           =var.OWNER
}