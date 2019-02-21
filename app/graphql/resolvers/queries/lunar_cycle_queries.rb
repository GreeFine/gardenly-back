module Resolvers
  module Queries
    module LunarCycleQueries
      class GetLunarCycle < GraphQL::Function
        description 'Get current LunarCycle'
        type Types::LunarCycleType

        def call(obj, args, ctx)
          LunarCycle.find_by!(year: Time.now.year)
        end
      end

    end
  end
end
