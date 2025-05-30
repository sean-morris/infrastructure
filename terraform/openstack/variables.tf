variable "prefix" {
  type        = string
  description = <<-EOT
  Prefix for all objects created by terraform.

  Primary identifier to 'group' together resources created by
  this terraform module. Prevents clashes with other resources
  in the cloud project / account.

  Should not be changed after first terraform apply - doing so
  will recreate all resources.

  Should not end with a '-', that is automatically added.
  EOT
}

# https://registry.terraform.io/providers/terraform-provider-openstack/openstack/latest/docs/resources/containerinfra_clustertemplate_v1#master_flavor-1
variable "master_flavor" {
  type = string

  # https://docs.jetstream-cloud.org/general/instance-flavors/
  default     = "m3.small"
  description = "Machine type for the master nodes"
}

# Picked latest ubuntu image from `openstack image list`
variable "image" {
  type    = string
  default = "ubuntu-jammy-kube-v1.31.0-240828-1652"
}

variable "capi_helm_chart_version" {
  type        = string
  description = "Version of the CAPI helm chart to use"
  # This a version of the CAPI helm chart that is known to work with the
  # the cluster autoscaler running on the management cluster
  # https://github.com/azimuth-cloud/capi-helm-charts/releases
  default = "0.10.1"
}

variable "notebook_nodes" {
  type = map(object({
    min : optional(number),
    max : number,
    machine_type : string,
    role : optional(string, "notebook"),
    labels : optional(map(string), {}),
  }))
  description = "Notebook node pools to create"
  default     = {}
}

variable "dask_nodes" {
  type = map(object({
    min : number,
    max : number,
    machine_type : string,
    labels : optional(map(string), {}),
    role : optional(string, "dask")
  }))
  description = "Dask node pools to create. Defaults to none."
  default     = {}
}

variable "core_node_machine_type" {
  type        = string
  default     = "m3.quad"
  description = <<-EOT
  Machine type to use for core nodes.

  Core nodes will always be on, and count as 'base cost'
  for a cluster. We should try to run with as few of them
  as possible.

  For single-tenant clusters, a single m3.quad node can be
  enough.
  EOT
}

variable "core_node_max_count" {
  type        = number
  default     = 5
  description = <<-EOT
  Maximum number of core nodes available.

  Core nodes can scale up to this many nodes if necessary.
  They are part of the 'base cost', should be kept to a minimum.
  This number should be small enough to prevent runaway scaling,
  but large enough to support occasional spikes for whatever reason.

  Minimum node count is fixed at 1, see https://bugs.launchpad.net/magnum/+bug/2098002
  EOT
}

variable "persistent_disks" {
  type = map(object({
    size        = number
    type        = optional(string, "replicated_hdd")
    name_suffix = optional(string, null)
    tags        = optional(map(string), {})
  }))
  default     = {}
  description = <<-EOT
  Deploy one or more Jetstream2 Volumes.

  This provisions a mountable block storage that can be used by jupyterhub-home-nfs
  server to store home directories for users.
  EOT
}