class Mutations::CreateGarden < Mutations::BaseMutation
  argument :name, String, required: true
  argument :data, String, required: true

  field :errors, [String], null: false

  def resolve(arguments)
    user = context[:current_user]
    if user.nil?
      return { errors: "Not connected" }
    end
    garden = Garden.new(arguments)
    garden.user = context[:current_user]

    if garden.save
      {
        errors: [],
      }
    else
      {
        errors: garden.errors.full_messages
      }
    end
  end
end
