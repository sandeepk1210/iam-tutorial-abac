#Resource to create SSH Key or Private Key
resource "tls_private_key" "demo_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

#Resource to Create Key Pair & Download Locally on Linux
resource "aws_key_pair" "demo_key_pair" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.demo_key.public_key_openssh
  
  provisioner "local-exec"{
    command = "echo '${tls_private_key.demo_key.private_key_pem}' > ./${var.key_pair_name}.pem"
  }
}