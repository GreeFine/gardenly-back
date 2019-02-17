module Resolvers
  module Queries
    module GardenQueries
      class GetGarden < GraphQL::Function
        description 'Get an Garden by id'
        type Types::GardenType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Garden.find(args[:id])
        end
      end

      class GetGardens < GraphQL::Function
        description 'Get multiple Gardens by ids'
        type types[Types::GardenType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Garden.find(args[:ids])
        end
      end

      class GetAllGardens < GraphQL::Function
        description 'Get all Gardens'
        type Types::GardenType.connection_type

        def call(obj, args, ctx)
          Garden.all
        end
      end

    end
  end
end
