provider "aws" {
  region = "us-east-1"

}

resource "aws_s3_bucket" "bucket-aws" {
  bucket = "impacta-kelvyn-michell-aws"
  acl    = "private"
}

#resource "aws_instance" "ec2-aws" {
  ami           = "PEGAR A AMI CORRETA DE UMA COM O DOCKER"
  instance_type = "t2.micro"
  key_name = "GERAR O NOME DA CHAVE"
  tags {
    Name = "Impacta - Kelvyn e Michell"
  }
}
