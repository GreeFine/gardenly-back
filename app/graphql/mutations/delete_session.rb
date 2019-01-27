class Mutations::DeleteSession < Mutations::BaseMutation
  field :errors, [String], null: false

  def resolve
    session = Session.find_by(uuid: context[:cookies][:token])
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
