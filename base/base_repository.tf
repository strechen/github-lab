resource "github_repository" "devops_base_repo" {
  name        = "tf-lab-devops"
  description = "${local.org_name}, repository for DevOps team"
  visibility  = "private"
  auto_init   = "true"
}

resource "github_repository_vulnerability_alerts" "repo_vulnerability_alerts" {
  repository = github_repository.devops_base_repo.name
  enabled    = true
}