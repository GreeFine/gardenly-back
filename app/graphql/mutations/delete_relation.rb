# frozen_string_literal: true

class Mutations::DeleteRelation < Mutations::BaseMutation
  argument :id, ID, required: true

  field :relation, Types::RelationType, null: true
  def resolve(params)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    relation = context[:current_user].relations.find(params[:id])
    return GraphQL::ExecutionError.new('Relation not found') if relation.nil?

    relation.delete()

    {
      relation: relation
    }
  end
end
