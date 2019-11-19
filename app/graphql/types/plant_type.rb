module Types
  class PlantType < Types::BaseObject
    description "User object"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :name, String, null: false
    field :photo, String, null: false
    field :thumbnail, String, null: true
    field :blossoming_start, [Integer], null: false
    field :blossoming_end, [Integer], null: false
    field :height_low, Integer, null: true
    field :height_high, Integer, null: true
    field :rusticity, Integer, null: true
    field :water_need, Integer, null: true
    field :sun_need, Integer, null: true
    field :model, Integer, null: true
    field :description, String, null: true
    field :tips, String, null: true
    field :ph_range_low, Float, null: true
    field :ph_range_high, Float, null: true
    field :colors, [ColorType], null: false
    field :type, TypeType, null: false
    field :periodicities, [PeriodicityType], null: false
    field :shapes, [ShapeType], null: false
    field :ground_types, [GroundTypeType], null: false

    def photo
      object.photo_url
    end

    def thumbnail
      object.photo_url(:thumbnail)
    end
  end
end
