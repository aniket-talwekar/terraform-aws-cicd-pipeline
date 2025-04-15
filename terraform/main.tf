provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  ami           = "ami-080b1a55a0ad28c02"  # AMI ID for 64-bit (x86)
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}

output "instance_id" {
  value = aws_instance.example.id
}
