package lib.terraform.CB_TFAWS_113

test_verify_elastic_cache_automatic_backup_passed {
    result := passed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_elasticache_cluster",
                                    "memcached_cluster"
                                    ],
                                    "Attributes": {
                                    "snapshot_retention_limit": "1"
                                    },
                                    "Blocks": [],
                                    "line_range": {
                                    "endLine": 3,
                                    "startLine": 1
                                    }
                                    }
                                    ]
    count(result) == 1
}

test_verify_elastic_cache_automatic_backup_failed {
    result := failed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_elasticache_cluster",
                                    "memcached_cluster"
                                    ],
                                    "Attributes": {
                                    "snapshot_retention_limit": "0"
                                    },
                                    "Blocks": [],
                                    "line_range": {
                                    "endLine": 3,
                                    "startLine": 1
                                    }
                                    }
                                    ]
    count(result) == 1
}