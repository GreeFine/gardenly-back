class Mutations::CreateMedium < Mutations::BaseMutation
  argument :title, String, required: true
  argument :description, String, required: false
  argument :picture, String, required: true

  field :medium, Types::MediumType, null: true
  field :errors, [String], null: false

  def resolve(arguments)
    medium = Medium.new(arguments)
    medium.user = context[:current_user]
    # raise Pundit::NotAuthorizedError unless MediumPolicy.new(context[:current_user], medium).create?

    if medium.save
      {
        medium: medium,
        errors: [],
      }
    else
      puts medium.errors.full_messages
      {
        medium: nil,
        errors: medium.errors.full_messages
      }
    end
  end
end
