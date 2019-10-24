module Types
  class NotificationType < Types::BaseObject
    description "Notification object"

    implements Types::ActiveRecordInterface

    field :id, ID, null: false
    field :body, String, null: false
    field :object_type, String, null: false
    field :object_type_id, ID, null: false
    field :user, UserType, null: true

  end
end
