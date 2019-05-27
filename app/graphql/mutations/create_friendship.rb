# frozen_string_literal: true

class Mutations::CreateFriendship < Mutations::BaseMutation
  argument :username, String, required: true

  field :success, Types::UserType, null: true
  def resolve(params)
    return GraphQL::ExecutionError.new('User not connected') if context[:current_user].nil?

    user = User.find_by(username: params[:username])
    return GraphQL::ExecutionError.new('User not found') if user.nil?

    return GraphQL::ExecutionError.new('Users are already friends') if user.friendships.include? context[:current_user]

    user.friendships.push(context[:current_user])
    context[:current_user].friendships.push(user)

    if user.save!
      {
        success: user
      }
    end
  end
end
