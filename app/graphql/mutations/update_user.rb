class Mutations::UpdateUser < Mutations::BaseMutation
  argument :name, String, required: false
  argument :age, Int, required: false

  field :user, Types::UserType, null: true
  field :errors, [String], null: false

  def resolve(params)
    user = Session.find_by(uuid: context[:cookies][:token]).user

    user.name = params[:name]
    user.age = params[:age]

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
