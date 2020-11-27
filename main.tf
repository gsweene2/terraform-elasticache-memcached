terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_elasticache_subnet_group" "memcached_subnet_group" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "memcached_cluster" {
  cluster_id                   = var.cluster_id
  engine                       = "memcached"
  node_type                    = var.node_type
  num_cache_nodes              = var.num_cache_nodes
  parameter_group_name         = var.parameter_group_name
  engine_version               = var.engine_version
  port                         = var.port
  subnet_group_name            = aws_elasticache_subnet_group.memcached_subnet_group.name
  maintenance_window           = var.maintenance_window
  security_group_ids           = var.security_group_ids
  apply_immediately            = var.apply_immediately
  az_mode                      = var.az_mode
  notification_topic_arn       = var.notification_topic_arn != null ? var.notification_topic_arn : null
  preferred_availability_zones = length(var.preferred_availability_zones) > 0 ? var.preferred_availability_zones : null
  depends_on                   = [ aws_elasticache_subnet_group.memcached_subnet_group ]
}
