class Mutations::UpdateUser < Mutations::BaseMutation
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :email, String, required: false
  argument :username, String, required: false
  argument :password, String, required: false
  argument :age, Int, required: false
  argument :address, String, required: false
  argument :date_of_birth, String, required: false
  argument :phone_number, String, required: false

  field :user, Types::UserType, null: true

  def resolve(params)
    user = context[:current_user]
    return GraphQL::ExecutionError.new('user_no_logon') if user.nil?

    user.assign_attributes(params)

    user.save!
    {
      user: user
    }
  end
end
