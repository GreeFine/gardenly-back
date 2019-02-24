module Resolvers
  module Queries
    module LunarCycleQueries
      class GetYearlyLunarCycle < GraphQL::Function
        description 'Get yearly LunarCycle'
        type Types::LunarCycleType

        def call(obj, args, ctx)
          LunarCycle.find_by!(year: Time.now.year)
        end
      end

      class GetLunarCycleFromToday < GraphQL::Function
        description 'Get next x LunarCycle'
        type Types::LunarCycleType
        argument :cycles_number, !types.Int

        def call(obj, args, ctx)
          response = RestClient::Request.execute(
            method: :get,
            url: "https://api.usno.navy.mil/moon/phase?date=#{Time.now.month}/#{Time.now.day}/#{Time.now.year}&nump=#{args[:cycles_number]}",
          )
          LunarCycle.create!(data: JSON.parse(response), year: Time.now.year)
        end
      end

    end
  end
end
