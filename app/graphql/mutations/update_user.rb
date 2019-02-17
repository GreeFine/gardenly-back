class Mutations::UpdateUser < Mutations::BaseMutation
  argument :name, String, required: false
  argument :age, Int, required: false
  argument :address, String, required: false
  argument :date_of_birth, String, required: false
  argument :phone_number, String, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(params)
    user = context[:current_user]
    if user.nil?
      return { errors: [ "Not connected" ] }
    end
    user.name = params[:name]
    user.age = params[:age]
    user.address = params[:address]
    user.date_of_birth = params[:date_of_birth]
    user.phone_number = params[:phone_number]

    if user.save
      {
        user: user,
        errors: [],
      }
    else
      {
        user: nil,
        errors: session.errors.full_messages
      }
    end
  end
end
