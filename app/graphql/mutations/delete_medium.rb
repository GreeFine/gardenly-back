class Mutations::DeleteMedium < Mutations::BaseMutation
  argument :id, ID, required: true

  field :medium, Types::MediumType, null: true

  def resolve(arguments)
    medium = Medium.find(arguments[:id])

    # raise Pundit::NotAuthorizedError unless MediumPolicy.new(context[:current_user], medium).destroy?

    medium.destroy!
    {
      medium: medium
    }
  end
end
