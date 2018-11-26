module Types
  MutationType = GraphQL::ObjectType.new.tap do |root_type|
    root_type.name = "Mutation"
    root_type.description = "The mutation root of the schema"

    root_type.interfaces = []

    # Bind here your Types::Mutation::YourModelMutation
    root_type.fields = Util::FieldCombiner.combine([

    ])
  end
end
