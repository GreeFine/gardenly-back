include Resolvers::Queries::LunarCycleQueries

module Types
  module Query
    LunarCycleQuery = GraphQL::ObjectType.define do
      name 'LunarCycleQuery'

      field :getLunarCycle, function: GetLunarCycle.new
    end
  end
end
