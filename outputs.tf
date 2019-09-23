output "vpc_id" {
  description = "THe ID of the VPC"
  value = "${aws_vpc.main.id}"
}

output "vpc_arn" {
  description = "THe Amazon Resource Name of the VPC"
  value = "${aws_vpc.main.arn}"
}

