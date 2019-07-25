# frozen_string_literal: true

class Mutations::CreateRoom < Mutations::BaseMutation
  argument :name, String, required: true
  argument :users, [ID], required: true

  field :room, Types::RoomType, null: true

  def resolve(arguments)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    room = Room.new(name: arguments[:name])
    room.users.push(context[:current_user])
    for user in arguments[:users]
      room.users.push(User.find(user))
    end

    # TODO: raise Pundit::NotAuthorizedError unless roomPolicy.new(context[:current_user], room).create?

    if room.save!
      {
        room: room
      }
    end
  end
end
