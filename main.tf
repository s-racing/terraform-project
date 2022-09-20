provider "aws" {
  region = "us-east-1"
  access_key = "AKIAVZUQ6RY3IBYG7VBC"
  secret_key = "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"
}

resource "aws_vpc" "development" {
  cidr_block = "10.0.0.0/16"
 tags = {
 Name : "development"
 }
}

resource "aws_subnet" "dev-aws_subnet" {
  vpc_id = aws_vpc.development.id 
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
   Name : "--subnetdevelopment"
  }
    
}
  data "aws_vpc" "existing_vpc" {
  #default  = true 
  id = aws_vpc.development.id 
}
 resource "aws_subnet" "dev-aws_subnet-1" {
       vpc_id = data.aws_vpc.existing_vpc.id
        cidr_block = "10.0.20.0/24"
        availability_zone = "us-east-1a"
        tags = {
          "dev-aws-newsubnet" = "newdeb add subnet"
        }

 }

 