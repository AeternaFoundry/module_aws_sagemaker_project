resource "aws_sagemaker_project" "sagemaker_projects" {
  for_each = var.sagemaker_projects

  project_name        = each.value.project_name
  project_description = each.value.project_description
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  service_catalog_provisioning_details {
    path_id                  = each.value.service_catalog_provisioning_details.path_id
    product_id               = each.value.service_catalog_provisioning_details.product_id
    provisioning_artifact_id = each.value.service_catalog_provisioning_details.provisioning_artifact_id
    dynamic "provisioning_parameter" {
      for_each = each.value.service_catalog_provisioning_details.provisioning_parameter != null ? each.value.service_catalog_provisioning_details.provisioning_parameter : []
      content {
        key   = provisioning_parameter.value.key
        value = provisioning_parameter.value.value
      }
    }
  }
}

