resource "github_team" "devops_team" {
  name        = "devops-team"
  description = "DevOps engineering team"
  privacy     = "secret"
}

resource "github_team" "nodejs_team" {
  name        = "nodejs-team"
  description = "Node.js development team"
  privacy     = "secret"
}

resource "github_team_members" "devops_team_member" {
  team_slug = github_team.devops_team.slug
  members {
    username = github_membership.admin_team_member.username
    role     = "maintainer"
  }
}

#resource "github_team_members" "nodejs_team_member" {
#}

resource "github_membership" "admin_team_member" {
  username = "strechen"
  role     = "admin"
}