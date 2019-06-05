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

    if arguments[:latitude].present? && arguments[:longitude].present?
      geoCountry = Geocoder.search([arguments[:latitude].to_f, arguments[:longitude].to_f])
      garden.country = geoCountry.first.country
    elsif arguments[:country].present?
      garden.country = arguments[:country]
    end

<<<<<<< HEAD
    garden.save!
    {
      garden: garden
    }
=======
    if garden.save!
      {
        garden: garden
      }
    end
>>>>>>> d4b3c01a32122bae841c833f3a7de37c5fd29eb4
  end
end
