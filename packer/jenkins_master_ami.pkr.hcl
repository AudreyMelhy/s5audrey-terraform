packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    Name          = "jenkins_master_ami-{{timestamp}}"
    id            = " "
    Teams         = " "
    environment   = "dev"
    project       = " "
    createBy      = "Terraform"
    cloudProvider = "aws"
    resource      = "jenkins_master"
  }
}

source "amazon-ebs" "jenkins_master" {
  ami_name      = "jenkins_master_ami-{{timestamp}}"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name              = "jenkins_ssh_ami"
      root-device-type    = "ebs" 
    }
    most_recent = true
    owners      = ["763237209150"]
  }
  tags         = var.tags
  ssh_username = "ubuntu"
}
build {
  name = "jenkins_master_ami-{{timestamp}}"
  sources = ["source.amazon-ebs.jenkins_master"]
  provisioner "shell" {
    execute_command = "echo 'packer' | sudo -S env {{ .Vars }} {{ .Path }}"
    script          = "jenkins_master_script.sh"
    pause_before    = "10s"

  }
}