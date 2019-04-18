class Mutations::CreateRoom < Mutations::BaseMutation
  argument :name, String, required: true

  field :room, Types::RoomType, null: true

  def resolve(arguments)
    room = Room.new(arguments)
    room.users.push(context[:current_user])
    # TODO: raise Pundit::NotAuthorizedError unless roomPolicy.new(context[:current_user], room).create?

    if room.save!
      {
        room: room,
      }
    end
  end
end
