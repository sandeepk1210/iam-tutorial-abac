data "aws_iam_policy" "EC2RoleforSSM" {
    arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

data "aws_iam_policy" "EC2RoleforCloudWatch" {
    arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

data "aws_iam_policy_document" "STS" {
    statement {
        effect = "Allow"

        principals {
            type = "Service"
            identifiers = ["ec2.amazonaws.com"]
        }

        actions = ["sts:AssumeRole"]
    }
}

resource "aws_iam_role" "CW-EC2" {
    name = "CW-EC2"
    description = "Allows EC2 instances to call Cloudwatch and SSM on your behalf"
    assume_role_policy = data.aws_iam_policy_document.STS.json

}

resource "aws_iam_instance_profile" "remote2ec2_instace_profile" {
    name = "CW-EC2"
    path = "/"
    role = aws_iam_role.CW-EC2.name
}

resource "aws_iam_role_policy_attachment" "iam_service_role_policy_attach" {
    for_each = toset([
        data.aws_iam_policy.EC2RoleforSSM.arn,
        data.aws_iam_policy.EC2RoleforCloudWatch.arn
    ])

    role = aws_iam_role.CW-EC2.name
    policy_arn = each.value
}