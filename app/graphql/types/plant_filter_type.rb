module Types
  class PlantFilterType < Types::BaseInputObject
    description "Plant Filters object for GetAllPlants query"

    argument :shapeIds, [ID], required: false
    argument :groundTypeIds, [ID], required: false
    argument :periodicityIds, [ID], required: false
    argument :typeId, ID, required: false
    argument :phLow, Float, required: false
    argument :phHigh, Float, required: false
    argument :rusticityLow, Integer, required: false
    argument :rusticityHigh, Integer, required: false
    argument :waterNeedLow, Integer, required: false
    argument :waterNeedHigh, Integer, required: false
    argument :sunNeedLow, Integer, required: false
    argument :sunNeedHigh, Integer, required: false
    argument :blossomingLow, Integer, required: false
    argument :blossomingHigh, Integer, required: false
    argument :color, [String], required: false
  end
end
