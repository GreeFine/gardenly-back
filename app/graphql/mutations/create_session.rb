class Mutations::CreateSession < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :errors, [String], null: false

  def resolve(params)
    if ! context[:current_session].nil?
      return { errors: [ "Already loged" ] }
    end

    user = User.find_by(email: params[:email], password: params[:password])
    if user.nil?
      return { errors: [ "Invalid user mail or password" ] }
    end

    session = Session.create(user: user) # TOOD: Delete session when cookie expire (1week)

    if session.save
      context[:cookies].signed[:token] = {value: session.uuid, httponly: true, expires: Time.now + 1.week}
      {
        errors: [],
      }
    else
      {
        errors: session.errors.full_messages
      }
    end
  end
end
