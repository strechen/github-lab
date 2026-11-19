resource "github_repository" "tf_github_lab_devops_repository" {
  name        = "tf-lab-devops"
  description = "${data.terraform_remote_state.base_config.outputs.organization_name}, repository for DevOps team"
  visibility  = "private"
  auto_init   = "true"
}

resource "github_repository" "nodejs_base_repo" {
  name                   = "tf-lab-app"
  description            = "TF GitHub lab repository for nodejs app"
  visibility             = "public"
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  allow_squash_merge     = true
  allow_merge_commit     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
  auto_init              = true
}

resource "github_repository_vulnerability_alerts" "nodejs_repo_vulnerability_alerts" {
  repository = github_repository.nodejs_base_repo.name
  enabled    = true
}

resource "github_repository_collaborators" "nodejs_base_repo_teams" {
  repository = github_repository.nodejs_base_repo.name
  team {
    permission = "push"
    team_id    = data.terraform_remote_state.base_config.outputs.nodejs_team_slug
  }

  team {
    permission = "push"
    team_id    = data.terraform_remote_state.base_config.outputs.security_manager_team_slug
  }

  team {
    permission = "pull"
    team_id    = data.terraform_remote_state.base_config.outputs.devops_team_slug
  }
}

resource "github_repository_file" "codeowners" {
  repository          = github_repository.nodejs_base_repo.name
  branch              = "main"
  file                = ".github/CODEOWNERS"
  commit_message      = "Managed by Terraform"
  overwrite_on_create = true
  content             = <<-EOT
      * @${data.terraform_remote_state.base_config.outputs.organization_name}/${data.terraform_remote_state.base_config.outputs.security_manager_team_slug}
    EOT
}