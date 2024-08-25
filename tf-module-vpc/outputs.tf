output "elb_dns_name" {
  value = "ELB URL is : ${aws_elb.ELB.dns_name}"
}


output "instance_ids" {
  value = "Instance id's  : ${aws_instance.Instance.id}"
}