module Resolvers
  module Queries
    module PlantFieldQueries
      class GetShapes < GraphQL::Function
        description 'Get all plant shapes'
        type types[Types::ShapeType]

        def call(_obj, _args, _ctx)
          Shape.all
        end
      end

      class GetGroundTypes < GraphQL::Function
        description 'Get all plant ground types'
        type types[Types::GroundTypeType]

        def call(_obj, _args, _ctx)
          GroundType.all
        end
      end

      class GetTypes < GraphQL::Function
        description 'Get all plant types'
        type types[Types::TypeType]

        def call(_obj, _args, _ctx)
          Type.all
        end
      end

      class GetPeriodicities < GraphQL::Function
        description 'Get all plant periodicities'
        type types[Types::PeriodicityType]

        def call(_obj, _args, _ctx)
          Periodicity.all
        end
      end

      class GetColors < GraphQL::Function
        description 'Get all plant colors'
        type types[types.String]

        def call(_obj, _args, _ctx)
          Plant.all.pluck(:color).flatter.uniq
        end
      end
    end
  end
end
