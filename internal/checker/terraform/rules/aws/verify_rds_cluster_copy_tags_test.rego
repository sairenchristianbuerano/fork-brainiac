package lib.terraform.CB_TFAWS_296

test_verify_rds_cluster_copy_tags_passed {
    result := passed with input as [
        {
            "Type": "resource",
            "Labels": [
                "aws_rds_cluster",
                "example"
            ],
            "Attributes": {
                "copy_tags_to_snapshot": true
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

test_verify_rds_cluster_copy_tags_failed {
    result := failed with input as [
        {
            "Type": "resource",
            "Labels": [
                "aws_rds_cluster",
                "example"
            ],
            "Attributes": {
                "copy_tags_to_snapshot": false
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