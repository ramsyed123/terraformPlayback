# Define provider
provider "aws" {
  region = "us-east-1"  
}

# S3 bucket
resource "aws_s3_bucket" "pb_bucket" {
  bucket = "pbbucket1232"  
}

# IAM policy that depends on the S3 bucket
resource "aws_iam_policy" "example_policy" {
  name        = "pbbucket_policy"
  description = "A policy to allow access to the example S3 bucket"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action   = ["s3:ListBucket"],
        Effect   = "Allow",
        Resource = [aws_s3_bucket.pb_bucket.arn]
      }
    ]
  })
  depends_on = [aws_s3_bucket.pb_bucket]
}

# Define VPC
resource "aws_vpc" "count_vpc" {
  cidr_block = "10.0.0.0/16"  
}

# Define a subnet within the VPC
resource "aws_subnet" "count_subnet" {
  vpc_id            = aws_vpc.count_vpc.id
  cidr_block        = "10.0.1.0/24"  
  availability_zone = "us-east-1a"  
}

# EC2 instances with count directly defined
resource "aws_instance" "countinstance" {
  count = 2  

  ami           = "ami-0e2c8caa4b6378d8c"  
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.count_subnet.id  # Specify the subnet ID
  tags = {
    Name = "countinstance-${count.index + 1}"
  }
}

# List of instance names using for_each expression
variable "instance_names" {
  type    = list(string)
  default = ["foreachinstance1", "foreachinstance2"]  
}

# EC2 instances using for_each
resource "aws_instance" "foreachinstance" {
  for_each = toset(var.instance_names)

  ami           = "ami-0e2c8caa4b6378d8c" 
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.count_subnet.id  # Specify the subnet ID
  tags = {
    Name = each.key
  }
}
