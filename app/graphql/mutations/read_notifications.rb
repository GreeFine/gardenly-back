class Mutations::ReadNotifications < Mutations::BaseMutation
  field :user, Types::UserType, null: true

  def resolve(arguments)
    user = context[:current_user]
    user.notifications_last_read = Time.now

    user.save!
    {
      user: user
    }
  end
end
