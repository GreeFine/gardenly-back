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
      raise GraphQL::ExecutionError.new('user_already_logged')
    end

    # TODO : check password is strong
    user = User.new(params)
    user.avatar = "https://s3.gardenly.app/dev/default-avatar.png" # default avatar

    # FIXME: Change public room for friends rooms
    if not Room.first.nil?
      publicroom = Room.first;
      user.rooms << publicroom
    end
    user.save!
    {
      user: user
    }
  end
end
