module "wordpress" {
  source  = "../../modules/wordpress"
  project = var.project
  stage   = var.stage
  region = var.region
}