package lib.terraform.CB_TFAWS_174

test_aws_ebs_snapshot_copy_encrypted_by_kms_utilizing_cmk_passed {
    result := passed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_ebs_snapshot_copy",
                                    "example_copy"
                                    ],
                                    "Attributes": {
                                    "kms_key_id": "ckv_kms",
                                    "source_region": "us-west-2",
                                    "source_snapshot_id": "aws_ebs_snapshot.example_snapshot.id",
                                    "tags": {
                                        "Name": "HelloWorld_copy_snap"
                                    }
                                    },
                                    "Blocks": [],
                                    "line_range": {
                                    "endLine": 8,
                                    "startLine": 1
                                    }
                                    }
                                ]
    count(result) == 1
}

test_aws_ebs_snapshot_copy_encrypted_by_kms_utilizing_cmk_failed {
result := failed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_ebs_snapshot_copy",
                                    "example_copy"
                                    ],
                                    "Attributes": {
                                    "kms_key_id": "",
                                    "source_region": "us-west-2",
                                    "source_snapshot_id": "aws_ebs_snapshot.example_snapshot.id",
                                    "tags": {
                                        "Name": "HelloWorld_copy_snap"
                                    }
                                    },
                                    "Blocks": [],
                                    "line_range": {
                                    "endLine": 8,
                                    "startLine": 1
                                    }
                                    }
                            ]
    count(result) == 1
}