# frozen_string_literal: true

class Mutations::DeleteFriendship < Mutations::BaseMutation
  argument :username, String, required: true

  field :success, Types::UserType, null: true
  def resolve(params)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    user = User.find_by(username: params[:username])
    return GraphQL::ExecutionError.new('User not found') if user.nil?

    friendShip = user.friendships.find(context[:current_user].id)
    return GraphQL::ExecutionError.new('Users are not friends') if friendShip.nil?

    user.friendships.delete(context[:current_user])
    context[:current_user].friendships.delete(user)

    if user.save!
      {
        success: user
      }
    end
  end
end
