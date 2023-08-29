resource "aws_amplify_app" "alltribe-front" {
  name       = "alltribes-web"

  enable_basic_auth = true
  basic_auth_credentials = base64encode("username1:password1")
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.alltribe-front.id
  branch_name = "master"

  framework = "React"
  stage     = "DEVELOPMENT"

  environment_variables = {
    REACT_APP_API_SERVER = "https://azure.app.com"
  }
}