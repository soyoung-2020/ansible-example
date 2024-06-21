#### Public Subnet 2EA ####  
resource "aws_subnet" "PUB_a" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.0.0.0/20"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "PUB_a"
  }
}
resource "aws_subnet" "PUB_c" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.16.0.0/20"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "PUB_c"
  }
}


#### Private Subnet 6EA ####    
resource "aws_subnet" "WEB_a" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.128.0.0/20"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "WEB_a"
  }
}
resource "aws_subnet" "WEB_c" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.144.3.0/20"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "WEB_c"
  }
}
resource "aws_subnet" "WAS_a" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.160.0.0/20"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "WAS_a"
  }
}
resource "aws_subnet" "WAS_c" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.176.0.0/20"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "WAS_c"
  }
}
resource "aws_subnet" "DB_a" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.192.0.0/20"
  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "DB_a"
  }
}
resource "aws_subnet" "DB_c" {
  vpc_id     = aws_vpc.team_VPC.id
  cidr_block = "10.208.0.0/20"
  availability_zone = "ap-northeast-2c"
  tags = {
    Name = "DB_c"
  }
}
