data "aws_caller_identity" "current" {}

data "aws_vpc" "default" {
 default = true
}

data "aws_availability_zones" "availability_zones" {
  state = "available"
}
