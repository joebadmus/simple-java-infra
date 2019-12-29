# resource "aws_key_pair" "demo_key" {
#   key_name   = "demo_key"
#   # public_key = "${file(var.public_key)}"
#   public_key = "sh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIyId1RsxTtB8x0gUkt5wqqAX1h/wY2HALVPjfnZYD52OHe5bNcMMZt/fKZ/fwONiwNDh+Dj8vnjSVkeP6sWy2SQFlUQU3Xne1VGVwr7SDrsUALdjUAJNw8gGne1dYsp3TXADSvyZ+OABPNRZJjWJK1VClCeLBVm83sbomG5ERovqRiOoFSOq0uRqivfCv08FyptZLEo8KDYMwxxO35tIm+7xAV6AtMpFhOHvkfruVzW4gwtuvHkKh8QW9smiJ0PIkP5EeIA8loP6oZyZ2gBq5lB8c5gVtkAdx55PqakHzKtG7B5YIH6IZTvOnXVAibjoDmFJ4W2oGV4ibZSytHCRv"
# }
# resource "aws_instance" "server" {
#   ami                    = "${var.ami}"
#   instance_type          = "${var.instance_type}"
#   key_name               = "${aws_key_pair.demo_key.key_name}"
#   vpc_security_group_ids = ["${aws_security_group.server_sg.id}"]
#   subnet_id              = "${element(aws_subnet.private_subnets.*.id, 0)}"
  
#   tags = {
#     Name = "server"
#   }
# }
# resource "aws_security_group" "server_sg" {
#   name        = "server_sg_${var.vpc_name}"
#   description = "Allow SSH from anywhere"
#   vpc_id      = "${aws_vpc.default.id}"
  
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
