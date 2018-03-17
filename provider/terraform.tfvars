terragrunt = {
  remote_state {
    backend = "s3"

    config {
      encrypt        = true
      bucket         = "moon-backend-bucket"
      key            = "${path_relative_to_include()}/terrafrom.tfstate"
      region         = "us-east-1"
      dynamodb_table = "terraform-locks"
    }
  }

  terraform {
    extra_arguments "bucket" {
      commands = ["${get_terraform_commands_that_need_vars()}"]
      optional_var-files = [
	"${get_tfvars_dir()}/${find_in_parent_folders("account.tfvars", "ingore")}"
      ]
    }
  }
}
