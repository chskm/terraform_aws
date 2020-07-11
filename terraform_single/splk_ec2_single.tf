# Build Single EC2 Instance in AWS

provider "aws" {
  profile = "default"
}

resource "aws_instance" "Splunk_Test" {
  ami               = lookup(var.ami,var.aws_region)
  instance_type     = var.instance_type
  security_groups   = [ "launch-wizard-2" ]
  key_name          = "deepthi_ec2_w2"
  availability_zone = "us-west-2a"

  root_block_device {
    volume_size            = 30
    delete_on_termination  = true
  }

  tags = {
    Name = "Splunk_Test"
  }
}

variable "ami" {
  type = map

  default = {
    "us-west-2" = "ami-02f147dfb8be58a10"
  }
}

variable "instance_count" {
  default = "1"
}

variable "instance_type" {
  default ="t2.micro"
}

variable "aws_region" {
  default = "us-west-2"
}
