# METADATA
# title: "Verify Postgres RDS as aws_db_instance has Query Logging enabled"
# description: "This helps enhance monitoring and auditing capabilities by capturing SQL queries executed on the database."
# scope: package
# related_resources:
# - https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/db_instance.html
# custom:
#   id: CB_TFAWS_332
#   severity: MEDIUM
package lib.terraform.CB_TFAWS_332

validResource := ["aws_db_instance", "aws_db_parameter_group"]

isvalid(block){
	block.Type == "resource"
    block.Labels[_] == validResource[_]
}

resource[resource] {
    block := pass[_]
	resource := concat(".", block.Labels)
} 

resource[resource] { 
    block := fail[_]
	resource := concat(".", block.Labels)
} 

isAWSRDSParamExist{
    resource := input[_]
    resource.Type == "resource"
    resource.Labels[_] == "aws_db_parameter_group"
}

pass[resource]{
    resource := input[_]
	isvalid(resource)
    isAWSRDSParamExist
    validEngine
}

pass[resource]{
    resource := input[_]
	isvalid(resource)
    hasLogStatement
    hasLogDurationStatement

}

validEngine{
    resource := input[_]
    resource.Type == "resource"
    resource.Labels[_] == "aws_db_instance"
    resource.Attributes.engine == "postgres"
}
hasLogStatement{
    resource := input[_]
	resource.Type == "resource"
    resource.Labels[_] == "aws_db_parameter_group"
    block := resource.Blocks[_]
    block.Type == "parameter"
    block.Attributes.name == "log_statement"
}

hasLogDurationStatement{
    resource := input[_]
	resource.Type == "resource"
    resource.Labels[_] == "aws_db_parameter_group"
    block := resource.Blocks[_]
    block.Type == "parameter"
    block.Attributes.name == "log_min_duration_statement"
}


fail[block] {
    block := input[_]
	isvalid(block)
   	not pass[block]
}

passed[result] {
	block := pass[_]
	result := { "message": "Postgres RDS as aws_db_instance has Query Logging enabled.",
                "snippet": block }
}

failed[result] {
    block := fail[_]
	result := { "message": "Postgres RDS as aws_db_instance should have Query Logging enabled.",
                "snippet": block }
} 