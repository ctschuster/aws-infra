########################################################################
# 01-basics/modules.tf
########################################################################

module "essentials" {
  source          = "../modules/essentials"

  account_alias   = var.account_alias
}
