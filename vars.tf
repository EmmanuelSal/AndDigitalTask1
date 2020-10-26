variable "AWS_ACCESS_KEY" {
}

variable "AWS_SECRET_KEY" {
}

variable "AWS_REGION" {
  default = "eu-west-2"
}

variable "AMIS" {
 type = map(string)
 default = {
	eu-east-1 = "ami-0a6aae90571909e92"
	eu-west-2 = "ami-0a6aae90571909e92"
	eu-west-3 = "ami-0a6aae90571909e92"
 }
}