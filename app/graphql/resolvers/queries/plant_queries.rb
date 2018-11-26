module Resolvers
  module Queries
    module PlantQueries
      class GetPlant < GraphQL::Function
        description 'Get an Plant by id'
        type Types::PlantType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Plant.find(args[:id])
        end
      end

      class GetPlants < GraphQL::Function
        description 'Get multiple Plants by ids'
        type types[Types::PlantType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Plant.find(args[:ids])
        end
      end

      class GetAllPlants < GraphQL::Function
        description 'Get all Plants'
        type Types::PlantType.connection_type

        def call(obj, args, ctx)
          Plant.all
        end
      end

    end
  end
end
