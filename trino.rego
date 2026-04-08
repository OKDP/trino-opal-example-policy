package trino

default allow := false

# Base users allowed core operations
allow {
    user := input.context.identity.user
    groups := input.context.identity.groups
    operation := input.action.operation

    data.trino.base_users[_] == user
    groups == []
    data.trino.base_operations[_] == operation
}

# Catalog-level access
allow {
    user := input.context.identity.user
    operation := input.action.operation
    resource := input.action.resource

    catalog := data.trino.catalog_permissions[user][_]
    operation == "AccessCatalog"
    resource.catalog.name == catalog
}

# Schema-level access
allow {
    user := input.context.identity.user
    operation := input.action.operation
    resource := input.action.resource

    catalog := data.trino.schema_permissions[user][_]
    operation == "ShowTables"
    resource.schema.catalogName == catalog
}

# Table-level access
allow {
    user := input.context.identity.user
    operation := input.action.operation
    resource := input.action.resource

    catalog := data.trino.table_permissions[user][_]
    data.trino.table_operations[_] == operation
    resource.table.catalogName == catalog
}