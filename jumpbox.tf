resource "aws_instance" "green_jumpbox" {
  ami                         = "${var.ami}"
  key_name                    = "${aws_key_pair.jumpbox_key.key_name}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(aws_subnet.public_subnets.*.id, 0)}"
  vpc_security_group_ids      = ["${aws_security_group.jumpbox-sg.id}"]
  associate_public_ip_address = true

  tags = {
    Name = "green_jumpbox_server"
  }
}

resource "aws_instance" "blue_jumpbox" {
  ami                         = "${var.ami}"
  key_name                    = "${aws_key_pair.jumpbox_key.key_name}"
  instance_type               = "${var.instance_type}"
  subnet_id                   = "${element(aws_subnet.public_subnets.*.id, 1)}"
  vpc_security_group_ids      = ["${aws_security_group.jumpbox-sg.id}"]
  associate_public_ip_address = true

  tags = {
    Name = "blue_jumpbox_server"
  }
}


resource "aws_key_pair" "jumpbox_key" {
  key_name   = "jumpbox_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD9/wdFt2nhiMdreAdL+iURqvlAA87+BzMCa3xxhM2ofzqP6HNFPwmIQcWXyexcigP3eOwLvRQY/BIsQ9ijp6wwzeC3syA4am5wD700tDb3FVUJgmuH8Nmfu8Kqgn4/FumlclGsdiM0jEc7RAjDl/R21WUVt3IlyuYQvIfYamE/t0rx9q9L4xoAqH//v4wtcLk6sBvDUKE/iuxOv46bxpvlw9ZamrnXCiaF2ZDUn9Y11Xy7wLTmE6o1FT0YliECIJi6KLvHXnI4PQxABYPCPwRjA4XVaulg9sBURIZ5JBDW1+qhrxvUo971RtP+xFsYUEHM58PTG+LZbkbNUZx7b+SE9DI+Sjd7Ksv6xnJgeAFyAGZ2OJhCJ1Em9mwMEGnmrhcxM53s646M48gP9OCLcjMQVZJOBbsFsOzE+z7YcW90Gvbp4W1lrb1TCh3EAyq5HUptCNuMigB+WU/D3lryXdK6jznft1q3X3RSPL4zcMGeH5JcsDZfDn3WlwvYrks3PmydGKgp0psRaErE9vxoAYccZKLLw2GAscoewmgzDgKUhzcWlY5ODlz8Gu7Dk1FVkxgQPvmF82ZsiMKOiVPADz3CemZWkAQOBQdzeEtSDWPK8QcTeJcl4KSsMg8r75jhbCtzS1cGdawatYCYyE5Gm1LVfmh3aoa3F7B/CA1rDk4sew== joebadmus@live.co.uk"
}

resource "aws_security_group" "jumpbox-sg" {
  name   = "jumpbox-security-group"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = -1
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
