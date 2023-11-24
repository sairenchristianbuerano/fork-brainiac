# METADATA
# title: "Verify that the 'log_executor_stats' flag in the PostgreSQL database is configured to 'off'"
# description: "Confirm that the configuration of the PostgreSQL database includes setting the 'log_executor_stats' flag to 'off,' assuring optimal management of executor statistics logging for enhanced system performance and monitoring."
# scope: package
# related_resources:
# - https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sql_database_instance
# custom:
#   id: CB_TFGCP_126
#   severity: MEDIUM
package lib.terraform.CB_TFGCP_126

import future.keywords.in

isvalid(block) {
	block.Type == "resource"
	"google_sql_database_instance" in block.Labels
}

resource[resource] {
	some block in pass
	resource := concat(".", block.Labels)
}

resource[resource] {
	some block in fail
	resource := concat(".", block.Labels)
}

fail[block] {
	some block in input
	isvalid(block)
	block.Attributes.database_version == "POSTGRES"
	some inner_block in block.Blocks
	inner_block.Type == "settings"
	some db_flags_block in inner_block.Blocks
	db_flags_block.Type == "database_flags"
	db_flags_block.Attributes.name == "log_executor_stats"
	db_flags_block.Attributes.value == "on"
}

pass[block] {
	some block in input
	isvalid(block)
	not fail[block]
}

passed[result] {
	some block in pass
	result := {
		"message": "The 'log_executor_stats' flag in the PostgreSQL database is configured to 'off'.",
		"snippet": block,
	}
}

failed[result] {
	some block in fail
	result := {
		"message": "The 'log_executor_stats' flag in the PostgreSQL database must be configured to 'off'.",
		"snippet": block,
	}
}
