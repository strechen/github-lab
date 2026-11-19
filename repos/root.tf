terraform {

}
provider "github" {
  owner = data.terraform_remote_state.base_config.outputs.organization_name
  token = var.gh_token
}