variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

variable "subnet_id" {
  description = "Subnet for single node cluster"
  default     = "subnet-1346f84f"
}
