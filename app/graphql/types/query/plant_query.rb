include Resolvers::Queries::PlantQueries

module Types
  module Query
    PlantQuery = GraphQL::ObjectType.define do
      name 'PlantQuery'

      field :getPlant, function: GetPlant.new
      field :getPlants, function: GetPlants.new
      connection :getAllPlants, function: GetAllPlants.new

    end
  end
end
