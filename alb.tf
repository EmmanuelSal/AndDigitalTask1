module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 5.0"
  name = "my-alb"

  load_balancer_type = "application"

  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  security_groups    = [aws_security_group.alb-securitygroup.id]

  target_groups = [
    {
      name_prefix      = "pref-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

# Need to input your own arn and change security group to access port 443
#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       #Input a certificate arn
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "Test"
    name = "my-alb"
  }
}
