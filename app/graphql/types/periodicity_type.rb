module Types
  class PeriodicityType < Types::BaseObject
    description "Periodicity object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false

  end
end
