# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    description 'User object'
    field :id, ID, null: false
    field :username, String, null: false
    field :first_name, String, null: false
    field :avatar, String, null: true
    field :last_name, String, null: false
    field :email, String, null: false
    field :age, Integer, null: true
    field :address, String, null: true
    field :date_of_birth, String, null: true
    field :phone_number, String, null: true
    field :is_moderator, Boolean, null: false
    field :articles, [ArticleType], null: false
    field :rooms, [RoomType], null: false
    field :media, [MediumType], null: false
    field :gardens, [GardenType], null: false
    field :relations, [RelationType], null: false

    def avatar
      object.avatar_url
    end

    def is_moderator
      object.moderator.present?
    end
  end
end
