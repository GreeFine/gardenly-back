module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = "Query"
    root_type.description = "The query root of the schema"

    root_type.interfaces = []

    root_type.fields = Util::FieldCombiner.combine([
      Types::Query::PlantQuery,
      Types::Query::UserQuery
    ])
  end
end
