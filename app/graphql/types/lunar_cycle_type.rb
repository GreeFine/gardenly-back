module Types
  class LunarCycleType < Types::BaseObject
    description "Lunar Cycle object"
    implements Types::ActiveRecordInterface

    field :id, ID, null: false
    field :data, String, null: false
    field :year, Integer, null: false

  end
end
