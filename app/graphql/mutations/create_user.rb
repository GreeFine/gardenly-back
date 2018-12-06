class Mutations::CreateUser < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true
  argument :name, String, required: true

  field :session, Types::SessionType, null: true
  field :errors, [String], null: false

  def resolve(params)
    user = User.create!(name: params[:name], email: params[:email], password: params[:password])

    session = Session.new(user: user)
    if session.save
      {
        session: session,
        errors: [],
      }
    else
      {
        session: nil,
        errors: session.errors.full_messages
      }
    end
  end
end
