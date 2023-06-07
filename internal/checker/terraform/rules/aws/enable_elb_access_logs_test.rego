package lib.terraform.CB_TFAWS_099

test_enable_elb_access_logs_passed {
    result := passed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_elb",
                                    "example"
                                    ],
                                    "Attributes": {},
                                    "Blocks": [
                                    {
                                        "Type": "access_logs",
                                        "Labels": [],
                                        "Attributes": {
                                        "enabled": true
                                        },
                                        "Blocks": [],
                                        "line_range": {
                                        "endLine": 4,
                                        "startLine": 2
                                        }
                                    }
                                    ],
                                    "line_range": {
                                    "endLine": 5,
                                    "startLine": 1
                                    }
                                    }
                                    ]
    count(result) == 1
}

test_enable_elb_access_logs_failed {
    result := failed with input as [
                                    {
                                    "Type": "resource",
                                    "Labels": [
                                    "aws_elb",
                                    "example"
                                    ],
                                    "Attributes": {},
                                    "Blocks": [
                                    {
                                        "Type": "access_logs",
                                        "Labels": [],
                                        "Attributes": {
                                        "enabled": false
                                        },
                                        "Blocks": [],
                                        "line_range": {
                                        "endLine": 4,
                                        "startLine": 2
                                        }
                                    }
                                    ],
                                    "line_range": {
                                    "endLine": 5,
                                    "startLine": 1
                                    }
                                    }
                                    ]
    count(result) == 1
}