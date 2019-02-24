class Mutations::DeleteSession < Mutations::BaseMutation
  field :success, Boolean, null: true

  def resolve
    session = context[:current_session]
    if session.nil?
      return GraphQL::ExecutionError.new("No session")
    end
    context[:cookies].delete :token
    if session.destroy!
      {
        success: true
      }
    end
  end
end
