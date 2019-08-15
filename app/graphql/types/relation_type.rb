# frozen_string_literal: true

module Types
  class RelationType < Types::BaseObject
    description 'relation object'
    implements Types::ActiveRecordInterface

    field :user, UserType, null: false
    field :friend, UserType, null: false
    field :state, Integer, null: false
  end
end
