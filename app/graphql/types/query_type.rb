module Types
  QueryType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = "Query"
    root_type.description = "The query root of the schema"

    root_type.interfaces = []

    root_type.fields = Util::FieldCombiner.combine([
      Types::Query::PlantQuery,
      Types::Query::UserQuery,
      Types::Query::MediumQuery,
      Types::Query::GardenQuery,
      Types::Query::ArticleQuery,
      Types::Query::LunarCycleQuery,
      Types::Query::RoomQuery,
      Types::Query::TaskQuery,
      Types::Query::PlantFieldQuery,
      Types::Query::MemoQuery,
      Types::Query::NotificationQuery
    ])
  end
end
