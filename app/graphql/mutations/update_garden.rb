# frozen_string_literal: true

class Mutations::UpdateGarden < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :data, String, required: false
  argument :latitude, String, required: false
  argument :longitude, String, required: false
  argument :country, String, required: false
  argument :items, Integer, required: false

  field :garden, Types::GardenType, null: true

  def resolve(arguments)
    user = context[:current_user]
    return GraphQL::ExecutionError.new('User not connected') if user.nil?

    garden = Garden.find(arguments[:id]) # FIXME: Maybe check if it's his garden ???
    garden.assign_attributes(arguments.except(:latitude, :longitude, :country))

    tmpData = JSON.parse(arguments[:data])

    tmpData["garden"].each do |tile|
      if tile["type"] == "FlowerBed"
        if Tile.find_by(key: tile["key"]).blank?
          tileModel = Tile.create!(garden_id: arguments[:id], key: tile["key"])
        else
          tileModel = Tile.find_by(key: tile["key"])
        end
        e["data"]["elements"].each do |element|
          if PlantTile.find_by(key: element.key, tile: tileModel).blank?
            pTile = PlantTile.create!(plant: Plant.where(model: element["model"]), tile: tileModel)
            plant = Plant.find_by(model: element["model"])
            if Task.joins(:plant_tile).where("garden_id = ? AND plant_tiles.plant_id = ?", arguments[:id], plant.id).count == 0
              Task.create!(garden_id: arguments[:id], plant_tile: pTile, start_date: plant.blossoming_start, end_date: plant.blossoming_end, body: "Il faut fleurir cette plante", public: false)
            end
          end
        end
      end
    end

    if arguments[:latitude].present? && arguments[:longitude].present?
      geoCountry = Geocoder.search([arguments[:latitude].to_f, arguments[:longitude].to_f])
      garden.country = geoCountry.first.country
    elsif arguments[:country].present?
      garden.country = arguments[:country]
    end

    if garden.save!
      {
        garden: garden
      }
    end
  end
end
