# frozen_string_literal: true

class Mutations::CreateUser < Mutations::BaseMutation
  argument :username, String, required: true
  argument :email, String, required: true
  argument :password, String, required: true
  argument :first_name, String, required: true
  argument :last_name, String, required: true

  field :user, Types::UserType, null: false

  def resolve(params)
    unless context[:current_session].nil?
      return GraphQL::ExecutionError.new('User still connected')
    end

    # TODO : check password is strong
    user = User.new(params)

    # FIXME: Change public room for friends rooms
    publicroom = Room.first;
    user.rooms << publicroom

    user.save!
    {
      user: user
    }
  end
end
