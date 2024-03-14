# METADATA
# title: "Verify Multi-AZ enabled in RDS instances"
# description: "Ensure the Multi-AZ feature is enabled for RDS instances to enhance database availability and fault tolerance."
# scope: package
# related_resources:
# - https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-rds-dbinstance.html
# custom:
#   id: CB_CFT_097
#   severity: LOW
package lib.cloudformation.CB_CFT_097
import future.keywords.in

resource := "AWS::RDS::DBInstance"

is_valid {
	some resources in input.Resources
	resources.Type == resource
}

pass[properties] {
	is_valid
	some resources in input.Resources
	resources.Type == resource
	properties := resources.Properties
    properties.MultiAZ == true
}

fail[resources] {
	some resources in input.Resources
	is_valid
	count(pass) == 0
}

passed[result] {
	some properties in pass
	result := {
		"message": "RDS instances have multi-AZ enabled",
		"snippet": properties,
	}
}

failed[result] {
	some properties in fail
	result := {
		"message": "RDS instances should enable multi-AZ",
		"snippet": properties,
	}
}
