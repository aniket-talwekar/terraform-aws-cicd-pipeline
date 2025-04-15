provider "aws" {
  region = "us-east-1"  # You can change the region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Example AMI, change to your preferred one
  instance_type = "t2.micro"

  tags = {
    Name = "MyEC2Instance"
  }
}

output "instance_id" {
  value = aws_instance.example.id
}
