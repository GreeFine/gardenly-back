class Mutations::DeleteSession < Mutations::BaseMutation
  field :errors, [String], null: false

  def resolve
    session = context[:current_session]
    if session.nil?
      return { errors: [ "Not connected" ] }
    end
    context[:cookies].delete :token
    if session.destroy
      {
        errors: []
      }
    else
      {
        errors: session.errors.full_messages
      }
    end
  end
end
