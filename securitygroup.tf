resource "aws_security_group" "myinstance" {
  vpc_id      = module.vpc.vpc_id
  name        = "myinstance"
  description = "instance security group"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-securitygroup.id]
  }

  tags = {
    Name = "myinstance"
  }
}

resource "aws_security_group" "alb-securitygroup" {
  vpc_id      = module.vpc.vpc_id
  name        = "alb"
  description = "Load balancer security group"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

#To make web page secure change from_port and to_port to use 443
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb"
  }
}