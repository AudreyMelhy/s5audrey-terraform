# This block specifies the required version of Packer and any required plugins
packer {
  required_version = ">= 1.5.0"

  required_plugins {
    amazon = {
      version = "1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "tags" {
  type = map(string)
  default = {
    Name          = "jenkins_ssh_ami-{{timestamp}}"
    id            = ""
    Teams         = ""
    environment   = "dev"
    project       = ""
    createBy      = "Terraform"
    cloudProvider = "aws"
    resource      = "jenkins_mase_ssh_image"
  }
}

# This block defines the source configuration for creating an Amazon EC2 image using the "amazon-ebs" builder
source "amazon-ebs" "ubuntu" {
  #   access_key = " "          # Access key for AWS authentication
  #   secret_key = " "  # Secret key for AWS authentication
  ami_name      = "jenkins_ssh_ami" # Name of the resulting AMI
  instance_type = "t2.micro"        # Instance type to use for building the image
  region        = "us-east-1"       # AWS region to use

  # Filters to find the source AMI to use as a base
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd/*ubuntu-*22.04-amd64-server*" # Filter criteria for AMI name
      root-device-type    = "ebs"                                                # Filter criteria for root device type
      virtualization-type = "hvm"                                                # Filter criteria for virtualization type
    }
    most_recent = true             # Use the most recent matching AMI
    owners      = ["099720109477"] # IDs of AMI owners
  }

  ssh_username = "ubuntu" # Username to use for SSH connection

  # Additional tags for the created AMI
    tags       = var.tags
    # Created-by = "AudreyMelhy"
}


# This block defines the build configuration
build {
  name    = "jenkins_ssh_ami"            # Name of the build
  sources = ["source.amazon-ebs.ubuntu"] # List of sources to use for building the image

  # Provisioner block to run shell commands during the image build process
  provisioner "shell" {
    inline = [
      # List of shell commands to execute
      "sudo useradd -m -s /bin/bash -G sudo jenkins",                             # Add a user 'jenkins' with necessary permissions
      "sudo chown -R jenkins:jenkins /home/jenkins",
      "echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/jenkins", # Grant sudo permissions to 'jenkins' user
      "sudo -u jenkins ssh-keygen -t rsa -N '' -f /home/jenkins/.ssh/id_rsa",     # Generate SSH key pair for 'jenkins' user
      "sudo cp /home/jenkins/.ssh/id_rsa.pub /home/jenkins/.ssh/authorized_keys"  # Copy public key to authorized_keys for SSH access
    ]
  }
}
