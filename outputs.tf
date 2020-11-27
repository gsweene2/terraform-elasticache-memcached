output "endpoint" {
    value = aws_elasticache_cluster.memcached_cluster.cluster_address
}