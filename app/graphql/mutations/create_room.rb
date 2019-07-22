# frozen_string_literal: true

class Mutations::CreateRoom < Mutations::BaseMutation
  argument :name, String, required: true

  field :room, Types::RoomType, null: true

  def resolve(arguments)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    room = Room.new(arguments)
    room.users.push(context[:current_user])

    # TODO: raise Pundit::NotAuthorizedError unless roomPolicy.new(context[:current_user], room).create?

    if room.save!
      {
        room: room
      }
    end
  end
end
