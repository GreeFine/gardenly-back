# frozen_string_literal: true

class Mutations::ChangeRelation < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :state, Integer, required: true

  field :relation, Types::RelationType, null: true
  def resolve(params)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    puts params[:id]
    relation = Relation.find(params[:id])
    puts "relation???", relation

    return GraphQL::ExecutionError.new('Relation not found') if relation.nil?

    #TODO Check on relation state permissions
    relation.state = params[:state]

    if relation.save!
      {
        relation: relation
      }
    end
  end
end
