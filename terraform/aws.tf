provider "aws" {
  region = "us-east-1"

}

resource "aws_s3_bucket" "bucket-aws" {
  bucket = "impacta-kelvyn-michell-aws"
  acl    = "private"
}

resource "aws_instance" "ec2-aws" {
  ami           = "ami-00eb20669e0990cb4"
  instance_type = "t2.micro"
  key_name = "Projeto-Yuri.pem"

  tags = {
    Name = "Impacta - Kelvyn e Michell"
  }
}
