module Types
  class GardenType < Types::BaseObject
    description "Garden Object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false
    field :data, String, null: false
  end
end
