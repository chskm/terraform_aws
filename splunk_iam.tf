provider "aws" {
  profile = "default"
}

resource "aws_instance" "Splunk_Infra_MC" {
  ami               = lookup(var.ami,var.aws_region)
  instance_type     = var.instance_type
  security_groups   = [ "launch-wizard-2" ]
  key_name          = "deepthi_ec2_w2"
  availability_zone = "us-west-2a"
  iam_instance_profile          = "splk_ec2_s3_full"

  root_block_device {
    volume_size            = 30
    delete_on_termination  = true
  }

  tags = {
    Name = "MC"
  }
}

variable "ami" {
  type = map

  default = {
    "us-west-2" = "ami-02f147dfb8be58a10"
  }
}

variable "instance_count" {
  default = "2"
}

variable "instance_type" {
  default ="t2.micro"
}

variable "aws_region" {
  default = "us-west-2"
}
