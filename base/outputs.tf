output "organization_id" {
  description = "Organization id"
  value       = github_organization_settings.github_org.id
}
data "github_organization_teams" "all" {
  root_teams_only = false
}
output "teams_ids" {
  description = "Github teams id"
  value       = toset([for team in data.github_organization_teams.all.teams : tostring(team.id)])
}
output "security_manager_team_slug" {
  description = "Security manager team slug"
  value       = github_team.security_team.slug
}
output "secret_names" {
  description = "Available secret names"
  value       = github_actions_organization_secret.org_secret.secret_name
}
output "base_repository_name" {
  description = "Base repository name"
  value       = github_repository.devops_base_repo.name
}
