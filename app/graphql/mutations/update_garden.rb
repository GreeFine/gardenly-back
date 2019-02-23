class Mutations::UpdateGarden < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :data, String, required: false
  argument :latitude, String, required: false
  argument :longitude, String, required: false
  argument :country, String, required: false

  field :garden, Types::GardenType, null: true
  field :errors, [String], null: false

  def resolve(arguments)
    garden = Garden.find(arguments[:id])
    if arguments[:name].present?
      garden.name = arguments[:name]
    end
    if arguments[:data].present?
      garden.data = arguments[:data]
    end
    if arguments[:latitude].present? && arguments[:longitude].present?
      geoCountry = Geocoder.search([arguments[:latitude].to_f, arguments[:longitude].to_f])
      garden.country = geoCountry.first.country
    elsif arguments[:country].present?
      garden.country = arguments[:country]
    end

    if garden.save
      {
        garden: garden,
        errors: [],
      }
    else
      {
        garden: nil,
        errors: session.errors.full_messages
      }
    end
  end
end
