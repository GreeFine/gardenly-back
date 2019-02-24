module Types
  class LunarCycleType < Types::BaseObject
    description "Lunar Cycle object"
    implements Types::ActiveRecordInterface

    field :id, ID, null: false
    field :data, String, null: false
    field :year, Integer, null: false
    
    def data
      object.data.to_json.to_s
    end
  end
end
