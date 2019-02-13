module Resolvers
  module Queries
    module UserQueries
      class GetUser < GraphQL::Function
        description 'Get an User by id'
        type Types::UserType

        argument :id, !types.ID

        def call(obj, args, ctx)
          User.find(args[:id])
        end
      end

      class GetUsers < GraphQL::Function
        description 'Get multiple Users by ids'
        type types[Types::UserType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          User.find(args[:ids])
        end
      end

      class GetAllUsers < GraphQL::Function
        description 'Get all Users'
        type Types::UserType.connection_type

        def call(obj, args, ctx)
          User.all
        end
      end

      class GetCurrentUser < GraphQL::Function
        description 'Get the current user'
        type Types::UserType

        def call(obj, args, ctx)
          if ctx[:current_user].nil?
            return { errors: "Not logged" } # How To do this proprely ?
          end
          ctx[:current_user]
        end
      end
    end
  end
end
