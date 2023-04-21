resource "aws_iam_user" "access_arnav_user" {
    name = "access-Arnav-peg-eng"

    tags = {
        "access-project" = "peg"
        "access-team" = "eng",
        "cost-center" = "987654"
    }
}

resource "aws_iam_user_login_profile" "access_arnav_user_login_profile" {
    user    = aws_iam_user.access_arnav_user.name
}

resource "aws_iam_user_policy_attachment" "access_arnav_user_attach_abac_access_assume_role" {
    user       = aws_iam_user.access_arnav_user.name
    policy_arn = aws_iam_policy.abac_access_assume_role.arn
}

resource "aws_iam_user" "access_mary_user" {
    name = "access-Mary-peg-qas"

    tags = {
        "access-project" = "peg"
        "access-team" = "qas",
        "cost-center" = "987654"
    }
}

resource "aws_iam_user_login_profile" "access_mary_user_login_profile" {
    user    = aws_iam_user.access_mary_user.name
}

resource "aws_iam_user_policy_attachment" "access_mary_user_attach_abac_access_assume_role" {
    user       = aws_iam_user.access_mary_user.name
    policy_arn = aws_iam_policy.abac_access_assume_role.arn
}

resource "aws_iam_user" "access_saanvi_user" {
    name = "access-Saanvi-uni-eng"

    tags = {
        "access-project" = "uni"
        "access-team" = "eng",
        "cost-center" = "123456"
    }
}

resource "aws_iam_user_login_profile" "access_saanvi_user_login_profile" {
    user    = aws_iam_user.access_saanvi_user.name
}

resource "aws_iam_user_policy_attachment" "access_saanvi_user_attach_abac_access_assume_role" {
    user       = aws_iam_user.access_saanvi_user.name
    policy_arn = aws_iam_policy.abac_access_assume_role.arn
}

resource "aws_iam_user" "access_carlos_user" {
    name = "access-Carlos-uni-qas"

    tags = {
        "access-project" = "uni"
        "access-team" = "qas",
        "cost-center" = "123456"
    }
}

resource "aws_iam_user_login_profile" "access_carlos_user_login_profile" {
    user    = aws_iam_user.access_carlos_user.name
}

resource "aws_iam_user_policy_attachment" "access_carlos_user_attach_abac_access_assume_role" {
    user       = aws_iam_user.access_carlos_user.name
    policy_arn = aws_iam_policy.abac_access_assume_role.arn
}