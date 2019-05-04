module Types
  class PlantType < Types::BaseObject
    description "User object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false
    field :photo, String, null: false

    def photo
      object.photo_url
    end
  end
end
