class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true

  field :user, Types::UserType, null: false

  def resolve(params)
    if ! context[:current_session].nil?
      return GraphQL::ExecutionError.new("User still connected")
    end
    # TODO : check password is strong
    user = User.new(params)
    user.save!()
    {
      user: user
    }
  end
end
