package lib.terraform.CB_TFAWS_112

test_aws_ecs_task_definition_transit_encryption_enabled_passed {
    result := passed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_eks_node_group",
                                    "example"
                                    ],
                                    "Attributes": {
                                    "cluster_name": "aws_eks_cluster.example.name"
                                    },
                                    "Blocks": [
                                    {
                                        "Type": "remote_access",
                                        "Labels": [],
                                        "Attributes": {
                                        "ec2_ssh_key": "some-key",
                                        "source_security_group_ids": "some-group"
                                        },
                                        "Blocks": [],
                                        "line_range": {
                                        "endLine": 7,
                                        "startLine": 4
                                        }
                                    }
                                    ],
                                    "line_range": {
                                    "endLine": 8,
                                    "startLine": 1
                                    }
                                    }
                                ]
    count(result) == 1
}

test_aws_ecs_task_definition_transit_encryption_enabled_failed {
result := failed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_eks_node_group",
                                    "example"
                                    ],
                                    "Attributes": {
                                    "cluster_name": "aws_eks_cluster.example.name"
                                    },
                                    "Blocks": [
                                    {
                                        "Type": "remote_access",
                                        "Labels": [],
                                        "Attributes": {
                                        "ec2_ssh_key": "some-key"
                                        },
                                        "Blocks": [],
                                        "line_range": {
                                        "endLine": 7,
                                        "startLine": 4
                                        }
                                    }
                                    ],
                                    "line_range": {
                                    "endLine": 8,
                                    "startLine": 1
                                    }
                                    }
                            ]
    count(result) == 1
}
