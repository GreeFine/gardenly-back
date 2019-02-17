include Resolvers::Queries::GardenQueries

module Types
  module Query
    GardenQuery = GraphQL::ObjectType.define do
      name 'GardenQuery'

      field :getGarden, function: GetGarden.new
      field :getGardens, function: GetGardens.new
      connection :getAllGardens, function: GetAllGardens.new
      connection :getAllUserGardens, function: GetAllUserGardens.new
    end
  end
end
