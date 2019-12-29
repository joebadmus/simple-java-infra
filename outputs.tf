output "VPC_ID" {
  value = "${data.terraform_remote_state.config.outputs.VPC_ID}"
}

output "appserver_subnets" {
  value = "${data.terraform_remote_state.config.outputs.Private_Subnets}"
}
