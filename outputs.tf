output "VPC_ID" {
  value = aws_vpc.default.id
}

output "Public_Subnets" {
  value = aws_subnet.public_subnets.*.id
}

output "Private_Subnets" {
  value = aws_subnet.private_subnets.*.id
}

output "Jumpbox_SG_ID" {
  value = "${aws_security_group.jumpbox-sg.id}"
}

output "GreenJumpbox_public" {
  value = "${aws_instance.green_jumpbox.public_ip}"
}

output "BlueJumpbox_public" {
  value = "${aws_instance.blue_jumpbox.public_ip}"
}