# output "availability_zone" {
#   value       = data.aws_availability_zones.availability_zones.names[0]
#   description = "Availability zone of ec2 instance"
# }

# output "access_arnav_password" {
#   value       = aws_iam_user_login_profile.access_arnav_user_login_profile.password
#   description = "Password of user arnav"
# }

# output "access_mary_password" {
#   value       = aws_iam_user_login_profile.access_mary_user_login_profile.password
#   description = "Password of user mary"
# }

# output "access_saanvi_password" {
#   value       = aws_iam_user_login_profile.access_saanvi_user_login_profile.password
#   description = "Password of user saanvi"
# }

# output "access_carlos_password" {
#   value       = aws_iam_user_login_profile.access_carlos_user_login_profile.password
#   description = "Password of user carlos"
# }

# output "s3_bucket_arn" {
#   value       = aws_s3_bucket.terraform_state.arn
#   description = "The ARN of the S3 bucket"
# }

# output "account_id" {
#   value = data.aws_caller_identity.current.account_id
# }

# output "caller_arn" {
#   value = data.aws_caller_identity.current.arn
# }

# output "caller_user" {
#   value = data.aws_caller_identity.current.user_id
# }

output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}

output "keypair_name" {
  value = var.key_pair_name
}