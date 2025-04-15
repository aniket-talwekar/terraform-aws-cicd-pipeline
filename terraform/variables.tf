variable "aws_region" {
  description = "AWS Region to deploy resources"
  default     = "ap-south-1"  # Mumbai Region
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"  # EC2 instance type
}
