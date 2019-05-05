class Mutations::CreateMessage < Mutations::BaseMutation
  argument :content, String, required: true
  argument :room_id, String, required: true

  field :message, Types::MessageType, null: true

  def resolve(arguments)
    message = Message.new(arguments)
    message.user = context[:current_user]
    # TODO: raise Pundit::NotAuthorizedError unless messagePolicy.new(context[:current_user], message).create?

    if message.save!
      {
        message: message,
      }
    end
  end
end
