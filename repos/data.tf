data "terraform_remote_state" "base_config" {
  backend = "local"
  config = {
    path = "../base/terraform.tfstate"
  }
}