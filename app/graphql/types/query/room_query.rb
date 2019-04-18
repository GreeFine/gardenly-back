include Resolvers::Queries::RoomQueries

module Types
  module Query
    RoomQuery = GraphQL::ObjectType.define do
      name 'RoomQuery'

      field :getRoom, function: GetRoom.new
      field :getRooms, function: GetRooms.new
      connection :getAllRooms, function: GetAllRooms.new
      connection :getAllUserRooms, function: GetAllUserRooms.new
    end
  end
end
