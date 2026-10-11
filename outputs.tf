output "sagemaker_projects_id" {
  description = "Map of id values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sagemaker_projects_arn" {
  description = "Map of arn values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "sagemaker_projects_project_description" {
  description = "Map of project_description values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.project_description if v.project_description != null && length(v.project_description) > 0 }
}
output "sagemaker_projects_project_id" {
  description = "Map of project_id values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "sagemaker_projects_project_name" {
  description = "Map of project_name values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.project_name if v.project_name != null && length(v.project_name) > 0 }
}
output "sagemaker_projects_region" {
  description = "Map of region values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.region if v.region != null && length(v.region) > 0 }
}
output "sagemaker_projects_service_catalog_provisioning_details" {
  description = "Map of service_catalog_provisioning_details values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => one(v.service_catalog_provisioning_details) if v.service_catalog_provisioning_details != null && length(v.service_catalog_provisioning_details) > 0 }
}
output "sagemaker_projects_tags" {
  description = "Map of tags values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "sagemaker_projects_tags_all" {
  description = "Map of tags_all values across all sagemaker_projects, keyed the same as var.sagemaker_projects"
  value       = { for k, v in aws_sagemaker_project.sagemaker_projects : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

