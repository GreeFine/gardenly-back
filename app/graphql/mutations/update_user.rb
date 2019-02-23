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
    if user.nil?
      return { errors: [ "Not connected" ] }
    end
    user.last_name = params[:last_name]
    user.first_name = params[:first_name]
    user.username = params[:username]
    user.password = params[:password]
    user.age = params[:age]
    user.email = params[:email]
    user.address = params[:address]
    user.date_of_birth = params[:date_of_birth]
    user.phone_number = params[:phone_number]

    if user.save!
      {
        user: user
      }
    end
  end
end
