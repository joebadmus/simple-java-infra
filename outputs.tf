output "VPC_ID" {
  value = "${data.terraform_remote_state.config.outputs.VPC_ID}"
}

output "webserver_ip" {
  value = "${data.terraform_remote_state.config.outputs.Public_Subnets}"
}


output "GreenWebServer_public" {
  value = "${aws_instance.green_webserver.public_ip}"
}

output "GreenWebServer_endpoint" {
    value = "http://${aws_instance.green_webserver.public_ip}  To connect ssh -i key ec2-user@${aws_instance.green_webserver.public_ip}"
}



output "BlueWebServer_public" {
  value = "${aws_instance.blue_webserver.public_ip}"
}

output "BlueWebServer_endpoint" {
    value = "http://${aws_instance.blue_webserver.public_ip}  To connect ssh -i key ec2-user@${aws_instance.blue_webserver.public_ip}"
}
