class Mutations::CreateGarden < Mutations::BaseMutation
  argument :name, String, required: true
  argument :data, String, required: true
  argument :latitude, String, required: false
  argument :longitude, String, required: false
  argument :country, String, required: false
  argument :items, Integer, required: false

  field :garden, Types::GardenType, null: false

  def resolve(arguments)
    user = context[:current_user]
    if user.nil?
      return { errors: "Not connected" }
    end

    garden = Garden.new(name: arguments[:name], data: arguments[:data], items: arguments[:items])
    garden.user = user

    if arguments[:latitude].present? && arguments[:longitude].present?
      geoCountry = Geocoder.search([arguments[:latitude].to_f, arguments[:longitude].to_f])
      garden.country = geoCountry.first.country
    elsif arguments[:country].present?
      garden.country = arguments[:country]
    end

    garden.save!
    {
      garden: garden,
      errors: [],
    }
  end
end
