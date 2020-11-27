variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "us-east-2"
}

# AWS Elasticache Subnet Group

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group

variable "subnet_group_name" {
  description = "(Required) Name for the cache subnet group. Elasticache converts this name to lowercase."
  default     = "tf-test-cache-subnet"
}

variable "subnet_ids" {
  description = "(Required) List of VPC Subnet IDs for the cache subnet group"
  default     = ["subnet-12345678","subnet-abcdefgh"]
}

# AWS Elasticache Cluster

# Descriptions: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster

variable "cluster_id" {
  description = "(Required) Group identifier. ElastiCache converts this name to lowercase"
  default     = "memcached-cluster"
}

variable "node_type" {
  description = "(Required unless replication_group_id is provided) The compute and memory capacity of the nodes. See Available Cache Node Types for supported node types"
  default     = "cache.t2.micro"
}

variable "num_cache_nodes" {
  description = "(Required unless replication_group_id is provided) The initial number of cache nodes that the cache cluster will have. For Redis, this value must be 1. For Memcache, this value must be between 1 and 20. If this number is reduced on subsequent runs, the highest numbered nodes will be removed."
  default     = 1
}

variable "parameter_group_name" {
  description = "(Required unless replication_group_id is provided) Name of the parameter group to associate with this cache cluster"
  default     = "default.memcached1.6"
}

variable "engine_version" {
  description = "(Optional) Version number of the cache engine to be used. See Describe Cache Engine Versions in the AWS Documentation center for supported versions"
  default     = "1.6.6"
}

variable "port" {
  description = "(Optional) The port number on which each of the cache nodes will accept connections. For Memcache the default is 11211, and for Redis the default port is 6379. Cannot be provided with replication_group_id."
  default     = 11211
}

variable "maintenance_window" {
  description = "(Optional) Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00"
  default = "sun:05:00-sun:09:00"
}

variable "security_group_ids" {
  description = "(Optional, VPC only) One or more VPC security groups associated with the cache cluster"
  default = []
}

variable "apply_immediately" {
  description = "(Optional) Specifies whether any database modifications are applied immediately, or during the next maintenance window. Default is false. See Amazon ElastiCache Documentation for more information. (Available since v0.6.0)"
  default = false
}

variable "az_mode" {
  description = "(Optional, Memcached only) Specifies whether the nodes in this Memcached node group are created in a single Availability Zone or created across multiple Availability Zones in the cluster's region. Valid values for this parameter are single-az or cross-az, default is single-az. If you want to choose cross-az, num_cache_nodes must be greater than 1"
  default = "single-az"
}

variable "notification_topic_arn" {
  description = "(Optional) An Amazon Resource Name (ARN) of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic"
  default = null
}

variable "preferred_availability_zones" {
  description = "(Optional, Memcached only) A list of the Availability Zones in which cache nodes are created. If you are creating your cluster in an Amazon VPC you can only locate nodes in Availability Zones that are associated with the subnets in the selected subnet group. The number of Availability Zones listed must equal the value of num_cache_nodes. If you want all the nodes in the same Availability Zone, use availability_zone instead, or repeat the Availability Zone multiple times in the list. Default: System chosen Availability Zones. Detecting drift of existing node availability zone is not currently supported. Updating this argument by itself to migrate existing node availability zones is not currently supported and will show a perpetual difference."
  default     = []
}
