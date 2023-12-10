data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "fis_trust_relationship" {
  statement {
    sid     = "FISAssumeRole"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["fis.amazonaws.com"]
    }

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }
}

resource "aws_iam_role" "fis" {
  name               = "${local.name}-fis"
  assume_role_policy = data.aws_iam_policy_document.fis_trust_relationship.json
}

resource "aws_iam_role_policy_attachment" "fis" {
  role       = aws_iam_role.fis.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSFaultInjectionSimuratorEKSAccess"
}
