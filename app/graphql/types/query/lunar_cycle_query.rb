include Resolvers::Queries::LunarCycleQueries

module Types
  module Query
    LunarCycleQuery = GraphQL::ObjectType.define do
      name 'LunarCycleQuery'

      field :getYearlyLunarCycle, function: GetYearlyLunarCycle.new
      field :getLunarCycleFromToday, function: GetLunarCycleFromToday.new
    end
  end
end
