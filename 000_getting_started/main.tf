# terraform {
#   #backend "remote" {
#   #  hostname = "app.terraform.io"
#   #  organization = "ExamPro"

#   #  workspaces {
#   #    name = "getting-started"
#   #  }
#   #}
#   cloud {
#     hostname = "app.terraform.io"
#     organization = "ExamPro"

#     workspaces {
#       name = "getting-started"
#     }
#   }

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 5.0"
#     }
#   }
# }

# locals {
#   project_name = "Andrew"
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.40.0"
    }
  }
}

provider "aws" {
  region  = "ca-central-1"
  profile = "default"
}

variable "instance_type" {
  type = string
}

locals {
  project_name = "Aaron"
  
}

resource "aws_instance" "my_server" {
  ami           = "ami-0e817e890550ad158"
  instance_type = var.instance_type

  tags = {
    Name = "myServer-${local.project_name}"
  }
}

output "instance_ip_addr" {
  value = aws_instance.my_server.public_ip
}
