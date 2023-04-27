resource "aws_security_group" "web_server_sg_tf" {
 name        = "web-server-sg-tf"
 description = "Allow HTTPS to web server"
 vpc_id      = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "allow_https" {
 type              = "ingress"
 description       = "HTTPS ingress"
 from_port         = 443
 to_port           = 443
 protocol          = "tcp"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.web_server_sg_tf.id
}

resource "aws_security_group_rule" "allow_all" {
 type              = "ingress"
 description       = "allow all"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.web_server_sg_tf.id
}

resource "aws_security_group_rule" "allow_outgoing_all" {
 type              = "egress"
 description       = "allow all"
 from_port         = 0
 to_port           = 0
 protocol          = "-1"
 cidr_blocks       = ["0.0.0.0/0"]
 security_group_id = aws_security_group.web_server_sg_tf.id
}