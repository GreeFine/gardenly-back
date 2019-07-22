# frozen_string_literal: true

class Mutations::UpdateGarden < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :additions, String, required: false
  argument :modifications, String, required: false
  argument :deletions, String, required: false
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
    garden.assign_attributes(arguments.except(:latitude, :longitude, :country, :modifications, :deletions, :additions))

    if arguments[:additions].present?
      additions = JSON.parse(arguments[:additions])
      additions.each do |el|
        begin
          case el["type"]
          when "FlowerBed"
            Tile.create!(key: el["key"], name: el["name"], ground_type_id: el["ground_type_id"], data: el["data"], garden: garden)
          when "StaticElement"
            StaticElement.create!(key: el["key"], data: el["data"], garden: garden)
          when "Plant"
            PlantTile.create!(key: el["key"], plant_id: el["plant_id"], tile: Tile.find_by(garden: garden, key: el["tile_key"]), age: el["age"], sun_exposition: el["sun_exposition"], data: el["data"])
          end
        rescue => error
          TechReport.create!(body: error)
        end
      end
    end

    if arguments[:modifications].present?
      modifications = JSON.parse(arguments[:modifications])
      modifications.each do |el|
        case el["type"]
        when "FlowerBed"
          tile = Tile.find_by(key: el["key"], garden: garden)
          tile.assign_attributes(el.except("type"))
          tile.save!
        when "StaticElement"
          st_el = StaticElement.find_by(key: el["key"], garden: garden)
          st_el.assign_attributes(el.except("type"))
          st_el.save!
        when "Plant"
          plant_t = PlantTile.find_by(key: el["key"], tile: garden.tiles)
          plant_t.assign_attributes(el.except("type"))
          plant_t.save!
        end
      end
    end

    if arguments[:deletions].present?
      deletions = JSON.parse(arguments[:deletions])
      deletions.each do |el|
        case el["type"]
        when "FlowerBed"
          tile = Tile.find_by(key: el["key"], garden: garden)
          tile.destroy!
        when "StaticElement"
          st_el = StaticElement.find_by(key: el["key"], garden: garden)
          st_el.destroy!
        when "Plant"
          plant_t = PlantTile.find_by(key: el["key"], tile: garden.tiles)
          plant_t.destroy!
        end
      end
    end

    if arguments[:latitude].present? && arguments[:longitude].present?
      geoCountry = Geocoder.search([arguments[:latitude].to_f, arguments[:longitude].to_f])
      garden.country = geoCountry.first.country
    elsif arguments[:country].present?
      garden.country = arguments[:country]
    end

    garden.save!
    {
      garden: garden
    }
    if garden.save!
      {
        garden: garden
      }
    end
  end
end
