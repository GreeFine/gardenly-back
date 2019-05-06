include Resolvers::Queries::PlantFieldQueries

module Types
  module Query
    PlantFieldQuery = GraphQL::ObjectType.define do
      name 'PlantFieldQuery'

      field :getShapes, function: GetShapes.new
      field :getGroundTypes, function: GetGroundTypes.new
      field :getTypes, function: GetTypes.new
      field :getPeriodicities, function: GetPeriodicities.new

    end
  end
end
