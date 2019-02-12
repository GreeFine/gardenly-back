class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :name, String, required: true

  field :errors, [String], null: false

  def resolve(params)
    if ! context[:current_session].nil?
      return { errors: [ "Currently connected"] }
    end
    # TODO : check password is strong
    user = User.create!(username: params[:username], name: params[:name], email: params[:email], password: params[:password])


    session = Session.create(user: user)
    if session.save
      context[:cookies][:token] = {value: session.uuid, httponly: true, expires: Time.now + 1.week}
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
