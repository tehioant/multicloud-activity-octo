variable "budget_required_mails" {
  type    = list(string)
  default = ["azure@ocho.ninja", "octo.tribu-psazure@accenture.com"]
}

variable "budget_optional_mails" {
  type    = list(string)
  default = []
}

variable "budget_cap" {
  type    = number
  default = 200
}

variable "notifications_webhook_url" {
  type    = string
  default = "https://mattermost.octo.tools/hooks/ch5zdqnraif7uddiyi5dueae9c"
}

variable "clientId" {
  type        = string
  sensitive   = true
  description = "Octopod ClientID"
}

variable "clientSecret" {
  type        = string
  sensitive   = true
  description = "Octopod Client Secret"
}

variable "aadClientId" {
  type        = string
  sensitive   = true
  description = "Azure AD Application ClientID"
}

variable "aadClientSecret" {
  type        = string
  sensitive   = true
  description = "Azure AD Application Client Secret"
}