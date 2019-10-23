module Types
  class MemoType < Types::BaseObject
    description "Memo object"

    implements Types::ActiveRecordInterface

    field :id, ID, null: false
    field :body, String, null: false
    field :user, UserType, null: true

  end
end
