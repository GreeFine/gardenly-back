# frozen_string_literal: true

module Resolvers
  module Queries
    module RoomQueries
      class GetRoom < GraphQL::Function
        description 'Get an Room by id'
        type Types::RoomType

        argument :id, !types.ID

        def call(_obj, args, _ctx)
          Room.find(args[:id])
        end
      end

      class GetRooms < GraphQL::Function
        description 'Get multiple Rooms by ids'
        type types[Types::RoomType]

        argument :ids, !types[types.ID]

        def call(_obj, args, _ctx)
          Room.find(args[:ids])
        end
      end

      class GetAllRooms < GraphQL::Function
        description 'Get all Rooms'
        type Types::RoomType.connection_type

        def call(_obj, _args, _ctx)
          Room.all
        end
      end

      class GetAllUserRooms < GraphQL::Function
        description 'Get all User Rooms'
        type Types::RoomType.connection_type

        def call(_obj, _args, ctx)
          return GraphQL::ExecutionError.new('user_no_logon') if ctx[:current_user].nil?

          ctx[:current_user].rooms
        end
      end
    end
  end
end
