package trino

default allow := false

user := input.context.identity.user
groups := input.context.identity.groups
operation := input.action.operation
resource := input.action.resource

# Base users allowed core operations
allow if {
    user in data.trino.base_users
    groups == []
    operation in data.trino.base_operations
}


# Catalog-level access
allow if {
    catalog := data.trino.catalog_permissions[user][_]
    operation == "AccessCatalog"
    resource.catalog.name == catalog
}

# Schema-level access
allow if {
    catalog := data.trino.schema_permissions[user][_]
    operation == "ShowTables"
    resource.schema.catalogName == catalog
}

# Table-level access
allow if {
    catalog := data.trino.table_permissions[user][_]
    operation in data.trino.table_operations
    resource.table.catalogName == catalog
}
