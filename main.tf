provider "aws" {
  region = "us-west-2"
}

variable "instance_type" {
  description = "Web Server"
  type = string
  default = "t3.micro"
}

resource "aws_instance" "webserver" {
  ami = "ami-0efdf839508ec2995"
  instance_type = var.instance_type
  availability_zone = "us-west-2b"
  security_groups = ["launch-wizard-3"]
  key_name = "navdeep-7aug25"
  tags = {
	Name = "Prod"
	}
}

resource "aws_ebs_volume" "webserverEBS" {
  availability_zone = "us-west-2b"
  size = 10
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.webserverEBS.id
  instance_id = aws_instance.webserver.id
}

resource "aws_eip" "lb" {
  instance = aws_instance.webserver.id
  domain = "vpc"
}




