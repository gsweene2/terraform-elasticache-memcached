terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_elasticache_subnet_group" "memcached_subnet_group" {
  name       = "tf-test-cache-subnet"
  subnet_ids = ["subnet-1346f84f"]
}

resource "aws_elasticache_cluster" "memcached_cluster" {
  cluster_id           = "memcached-cluster"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "1.6.6"
  port                 = 11211
  subnet_group_name    = aws_elasticache_subnet_group.memcached_subnet_group.name
}
