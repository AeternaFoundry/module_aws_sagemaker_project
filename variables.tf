variable "sagemaker_projects" {
  description = <<EOT
Map of sagemaker_projects, attributes below
Required:
    - project_name
    - service_catalog_provisioning_details (block):
        - path_id (optional)
        - product_id (required)
        - provisioning_artifact_id (optional)
        - provisioning_parameter (optional, block):
            - key (required)
            - value (optional)
Optional:
    - project_description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    project_name        = string
    project_description = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    service_catalog_provisioning_details = object({
      path_id                  = optional(string)
      product_id               = string
      provisioning_artifact_id = optional(string)
      provisioning_parameter = optional(list(object({
        key   = string
        value = optional(string)
      })))
    })
  }))
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_projects : (
        (length(v.project_name) >= 1 && length(v.project_name) <= 32) && (can(regex("^[0-9A-Za-z](-*[0-9A-Za-z]){0,31}$", v.project_name)))
      )
    ])
    error_message = "all of: must be between 1 and 32 characters; Valid characters are a-z, A-Z, 0-9, and - (hyphen)."
  }
  validation {
    condition = alltrue([
      for k, v in var.sagemaker_projects : (
        v.project_description == null || (length(v.project_description) >= 1 && length(v.project_description) <= 1024)
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
}

