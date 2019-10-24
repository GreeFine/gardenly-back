module Resolvers
  module Queries
    module MediumQueries
      class GetMedium < GraphQL::Function
        description 'Get an Medium by id'
        type Types::MediumType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Medium.find(args[:id])
        end
      end

      class GetMedia < GraphQL::Function
        description 'Get multiple Media by ids'
        type types[Types::MediumType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Medium.find(args[:ids])
        end
      end

      class GetUserMedia < GraphQL::Function
        description 'Get all Media'
        type Types::MediumType.connection_type

        def call(obj, args, ctx)
          Medium.where(user: ctx[:current_user])
        end
      end

      class GetAllMedia < GraphQL::Function
        description 'Get all Media'
        type Types::MediumType.connection_type

        def call(obj, args, ctx)
          Medium.all
        end
      end

    end
  end
end
