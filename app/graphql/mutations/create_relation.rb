# frozen_string_literal: true

class Mutations::CreateRelation < Mutations::BaseMutation
  argument :username, String, required: true
  argument :state, Integer, required: true

  field :relation, Types::RelationType, null: true
  def resolve(params)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    friend = User.find_by(username: params[:username])
    return GraphQL::ExecutionError.new('User not found') if friend.nil?

    relation = Relation.new()
    relation.user = context[:current_user]
    relation.friend = friend
    #TODO Check on relation state permissions
    relation.state = params[:state]

    if relation.save!
      {
        relation: relation
      }
    end
  end
end
