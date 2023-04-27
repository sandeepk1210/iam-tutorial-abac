#Get Ubuntu latest AMI by query parameter store
# data "aws_ssm_parameter" "ami" {
#   name = "/aws/service/canonical/ubuntu/server/16.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
# }

##Get Ubuntu AMI by using the aws_ami data source
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

#Get Amazon Linux 2 AMI
# data "aws_ami" "amazon-linux-2" {
#   most_recent = true

#   filter {
#     name   = "owner-alias"
#     values = ["amazon"]
#   }

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-ebs"]
#   }
# }

resource "aws_instance" "ec2_instance" {
  #Configure AMI as Amazon Linux 2
  #ami                  = data.aws_ami.amazon-linux-2.id
  #Configure AMI as Ubuntu
  #ami = data.aws_ssm_parameter.ami.value
  ami = data.aws_ami.ubuntu.id
  instance_type        = "t2.small"
  key_name             = "web-server-key"
  associate_public_ip_address = true
  availability_zone    = data.aws_availability_zones.availability_zones.names[0]
  vpc_security_group_ids = [aws_security_group.web_server_sg_tf.id]
  iam_instance_profile = aws_iam_role.CW-EC2.name

  tags = {
    Name = "Remote Test"
  }
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = data.aws_availability_zones.availability_zones.names[0]
  size              = 40
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.ec2_instance.id
}