# frozen_string_literal: true

class Mutations::CreateSession < Mutations::BaseMutation
  argument :email, String, required: true
  argument :password, String, required: true

  field :expires, String, null: true

  def resolve(params)
    return GraphQL::ExecutionError.new('Already loged') unless context[:current_session].nil?

    user = User.find_by(email: params[:email], password: params[:password])
    return GraphQL::ExecutionError.new('Invalid user mail or password') if user.nil?

    session = Session.create(user: user)

    # TODO: Cookie and session should be destroyed in time (1week)
    context[:cookies].signed[:token] = { value: session.uuid, httponly: true }
    {
      expires: (Time.now + 1.week).strftime('%h/%d/%m/%Y')
    }
  end
end
