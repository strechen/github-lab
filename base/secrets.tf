resource "github_actions_organization_secret" "org_secret" {
  secret_name = "my_API_secret"
  visibility  = "selected"
  value       = var.password
}