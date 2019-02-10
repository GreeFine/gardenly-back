class Mutations::CreateGarden < Mutations::BaseMutation
  argument :name, String, required: true
  argument :data, String, required: true

  field :errors, [String], null: false

  def resolve(arguments)
    puts "Args?:"
    puts arguments
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
