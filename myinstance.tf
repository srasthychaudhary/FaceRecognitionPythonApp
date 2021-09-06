provider "aws" {
    profile = "default"
    region = "us-east-1"
    access_key = "QWERTYUIOASDFGHJKSWEDRTGYHUJKVCVBNMVFGHJKJHBGVBNM"
    secret_key = "ERTYUIJOKKLJNHBVCXVBEDFRRYUIOKJUYGFDGVHBJKBFVGHJK"
}

resource "aws_instance" "os1"{
    ami = "ami-000000000000000000"
    instance_type = "t2.micro"
    security_groups = ["AllTraffic-Anywhere"]
    user_data = <<-EOF
	#!/bin/bash
	yum install httpd -y
	echo  "Server Launched.." > /var/www/html/index.html
	systemctl httpd start
	EOF
    
    }
