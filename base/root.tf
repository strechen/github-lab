terraform {

}
provider "github" {
  owner = local.org_name
  token = var.gh_token
}