class Mutations::UpdateMedium < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :title, String, required: true
  argument :description, String, required: false

  field :medium, Types::MediumType, null: true

  def resolve(arguments)
    medium = Medium.find(arguments[:id])
    medium.assign_attributes(arguments)

    # raise Pundit::NotAuthorizedError unless MediumPolicy.new(context[:current_user], medium).update?

    medium.save!
    {
      medium: medium
    }
  end
end
