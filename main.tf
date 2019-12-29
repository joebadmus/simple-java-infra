data "template_file" "webserver_data" {
  template = "${file("template/webserver.tpl")}"
}

resource "aws_instance" "green_webserver" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  instance_type               = "${var.instance_type}"
  user_data                   = "${data.template_file.webserver_data.rendered}"
  subnet_id                   = "${element(aws_subnet.public_subnets.*.id, 0)}"
  vpc_security_group_ids      = ["${aws_security_group.webserver-sg.id}"]
  associate_public_ip_address = true

  tags = {
    Name = "green_webserver"
  }
}

resource "aws_instance" "blue_webserver" {
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(aws_subnet.public_subnets.*.id, 1)}"
  vpc_security_group_ids      = ["${aws_security_group.webserver-sg.id}"]
  associate_public_ip_address = true

  tags = {
    Name = "blue_webserver"
  }
}

resource "aws_security_group" "webserver-sg" {
  name   = "webserver-security-group"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
