# frozen_string_literal: true

class Mutations::DeleteSession < Mutations::BaseMutation
  field :success, Boolean, null: true

  def resolve
    session = context[:current_session]
    return GraphQL::ExecutionError.new('No session found') if session.nil?

    context[:cookies].delete :token
    if session.destroy!
      {
        success: true
      }
    end
  end
end
