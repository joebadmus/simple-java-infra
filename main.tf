data "template_file" "appserver_data" {
  template = "${file("template/appserver.tpl")}"
}

resource "aws_instance" "green_javaappserver" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  instance_type               = "${var.instance_type}"
  user_data                   = "${data.template_file.appserver_data.rendered}"
  subnet_id                   = "${element(data.terraform_remote_state.config.outputs.Private_Subnets, 0)}"
  vpc_security_group_ids      = ["${aws_security_group.javaappserver-sg.id}"]
  associate_public_ip_address = false

  tags = {
    Name = "green_javaappserver"
  }
}

resource "aws_instance" "blue_javaappserver" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(data.terraform_remote_state.config.outputs.Private_Subnets, 1)}"
  vpc_security_group_ids      = ["${aws_security_group.javaappserver-sg.id}"]
  associate_public_ip_address = false

  tags = {
    Name = "blue_javaappserver"
  }
}

resource "aws_instance" "green_redisappserver" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  instance_type               = "${var.instance_type}"
  user_data                   = "${data.template_file.appserver_data.rendered}"
  subnet_id                   = "${element(data.terraform_remote_state.config.outputs.Private_Subnets, 0)}"
  vpc_security_group_ids      = ["${aws_security_group.redisappserver-sg.id}"]
  associate_public_ip_address = false

  tags = {
    Name = "green_redisappserver"
  }
}

resource "aws_instance" "blue_redisappserver" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(data.terraform_remote_state.config.outputs.Private_Subnets, 1)}"
  vpc_security_group_ids      = ["${aws_security_group.redisappserver-sg.id}"]
  associate_public_ip_address = false

  tags = {
    Name = "blue_redisappserver"
  }
}

resource "aws_security_group" "javaappserver-sg" {
  name   = "javaappserver-security-group"
  vpc_id = "${data.terraform_remote_state.config.outputs.VPC_ID}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "redisappserver-sg" {
  name   = "redisappserver-security-group"
  vpc_id = "${data.terraform_remote_state.config.outputs.VPC_ID}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    protocol    = "tcp"
    from_port   = 6379
    to_port     = 6379
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
