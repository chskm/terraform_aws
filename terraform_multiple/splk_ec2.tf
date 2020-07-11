# Build servers in aws

provider "aws" {
  profile = "default"
}

resource "aws_instance" "Splunk_Infra_CM" {
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
    Name = "CM"
  }
}

resource "aws_instance" "Splunk_Infra_IDX_AZ_A" {
  count             = var.instance_count
  ami               = lookup(var.ami,var.aws_region)
  instance_type     = var.instance_type
  security_groups   = [ "launch-wizard-2" ]
  key_name          = "deepthi_ec2_w2"
  availability_zone = "us-west-2a"

  root_block_device {
   volume_size           = 30
   delete_on_termination = true
  }

  tags = {
    Name = "IDX-${count.index + 1}"
  }
}

resource "aws_instance" "Splunk_Infra_IDX_AZ_B" {
  count             = var.instance_count
  ami               = lookup(var.ami,var.aws_region)
  instance_type     = var.instance_type
  security_groups   = [ "launch-wizard-2" ]
  key_name          = "deepthi_ec2_w2"
  availability_zone = "us-west-2b"

  root_block_device {
   volume_size           = 30
   delete_on_termination = true
  }

  tags = {
    Name = "IDX-${count.index + 1}"
  }
}

resource "aws_instance" "Splunk_Infra_IDX_AZ_C" {
  count             = var.instance_count
  ami               = lookup(var.ami,var.aws_region)
  instance_type     = var.instance_type
  security_groups   = [ "launch-wizard-2" ]
  key_name          = "deepthi_ec2_w2"
  availability_zone = "us-west-2c"

  root_block_device {
   volume_size           = 30
   delete_on_termination = true
  }

  tags = {
    Name = "IDX-${count.index + 1}"
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
