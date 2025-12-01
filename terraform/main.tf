provider "aws" {
    region = "us-west-2"  # Set your desired AWS region
}

resource "aws_instance" "my_ec2_instance" {
    ami           = "ami-03aa99ddf5498ceb9"  # Specify an appropriate AMI ID
    instance_type = "t3.micro" # Specify instance type
    key_name      = "key" # Specift key pair valu
    tags = {
        Name = "MyterraformEC2"
   }
}
