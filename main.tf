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
  key_name = "navdeep-7aug25"
  tags = {
	Name = "Prod"
	}
}

resource "aws_ebs_volume" "webserverEBS" {
  availability_zone = "us-west-2a"
  size = 10
}
