resource "aws_amplify_app" "alltribe-front" {
  name       = "alltribes-web"
  repository = "https://github.com/tehioant/multicloud-activity-octo"

  # GitHub personal access token
  access_token = "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"
}