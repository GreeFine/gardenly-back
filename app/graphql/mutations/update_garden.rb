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
    garden = Garden.find(arguments[:id])
    garden.assign_attributes(arguments.except(:latitude, :longitude, :country))

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
  end
end
