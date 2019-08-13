# Define composite variables for resources
module "label" {
  source     = "git::https://github.com/pgalchemy/terraform-null-label.git?ref=tags/0.14.1"
  namespace  = var.namespace
  name       = var.name
  stage      = var.stage
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
}

resource "aws_elastic_beanstalk_application" "default" {
  name        = var.custom_name ? var.application_name : module.label.id
  description = var.description
}
