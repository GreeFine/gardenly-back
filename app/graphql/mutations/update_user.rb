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
      return GraphQL::ExecutionError.new("User not connected")
    end
    if params[:last_name]
      user.last_name = params[:last_name]
    end
    if params[:first_name]
      user.first_name = params[:first_name]
    end
    if params[:username]
      user.username = params[:username]
    end
    if params[:password]
      user.password = params[:password]
    end
    if params[:age]
      user.age = params[:age]
    end
    if params[:email]
      user.email = params[:email]
    end
    if params[:address]
      user.address = params[:address]
    end
    if params[:date_of_birth]
      user.date_of_birth = params[:date_of_birth]
    end
    if params[:phone_number]
      user.phone_number = params[:phone_number]
    end

    if user.save!
      {
        user: user
      }
    end
  end
end
