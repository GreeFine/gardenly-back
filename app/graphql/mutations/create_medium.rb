class Mutations::CreateMedium < Mutations::BaseMutation
  argument :title, String, required: false
  argument :description, String, required: false
  argument :picture, String, required: true

  field :medium, Types::MediumType, null: true

  def resolve(arguments)
    medium = Medium.new(arguments)
    medium.user = context[:current_user]
    # raise Pundit::NotAuthorizedError unless MediumPolicy.new(context[:current_user], medium).create?

    medium.save!
    {
      medium: medium
    }
  end
end
