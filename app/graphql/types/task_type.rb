module Types
  class TaskType < Types::BaseObject
    description "Task object (contient le jardin, la tache son status, le mois de debut et fin)\
      contient aussi un PlantTile Object contenant le parterre concerne et la plante"
    implements Types::ActiveRecordInterface
    field :id, ID, null: false
    field :plant_tile, PlantTileType, null: false
    field :garden, GardenType, null: false
    field :status, String, null: false
    field :start_date, Integer, null: false
    field :end_date, Integer, null: false
    field :body, String, null: true

  end
end
