package lib.terraform.CB_TFRAN_104

test_rancher2_user_configuration_passed {
    result := passed with input as [{
        "Type": "resource",
        "Labels": [
            "rancher2_user",
            "foo"
        ],
        "Attributes": {
            "enabled": true,
            "name": "Foo user",
            "password": "changeme",
            "username": "foo"
        },
        "Blocks": [],
        "line_range": {
            "endLine": 7,
            "startLine": 2
        }
    }]
    count(result) == 1
}

test_rancher2_user_configuration_failed {
    result := failed with input as [{
        "Type": "resource",
        "Labels": [
            "rancher2_user",
            "foo"
        ],
        "Attributes": {
            "enabled": true,
            "name": "Foo user",
            "password": "",
            "username": ""
        },
        "Blocks": [],
        "line_range": {
            "endLine": 7,
            "startLine": 2
        }
    }]
    count(result) == 1
}