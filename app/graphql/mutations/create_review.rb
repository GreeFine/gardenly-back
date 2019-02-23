class Mutations::CreateReview < Mutations::BaseMutation
  argument :vote, Boolean, required: true
  argument :article_id, ID, required: true

  field :review, Types::ReviewType, null: true

  def resolve(arguments)
    review = Review.new(arguments)
    review.user = context[:current_user]
    # TODO: raise Pundit::NotAuthorizedError unless reviewPolicy.new(context[:current_user], review).create?

    if review.save!
      {
        review: review,
      }
    end
  end
end
