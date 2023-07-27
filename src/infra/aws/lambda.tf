#data "aws_iam_policy_document" "assume_role" {
#  statement {
#    effect = "Allow"
#
#    principals {
#      type        = "Service"
#      identifiers = ["lambda.amazonaws.com"]
#    }
#
#    actions = ["sts:AssumeRole"]
#  }
#}
#
#resource "aws_iam_role" "iam_for_lambda" {
#  name               = "iam_for_lambda"
#  assume_role_policy = data.aws_iam_policy_document.assume_role.json
#  tags = {
#    Owner = "ANTE"
#  }
#}
#
#resource "aws_lambda_function" "lambda_alltribes" {
#  filename      = "lambda_function_alltribes.zip"
#  function_name = "lambda_alltribes"
#  role          = aws_iam_role.iam_for_lambda.arn
#
#  runtime = "nodejs18.x"
#  handler = "exports.test"
#  tags = {
#    Owner = "ANTE"
#  }
#}