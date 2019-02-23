class Mutations::CreateComment < Mutations::BaseMutation
  argument :content, String, required: true
  argument :article_id, ID, required: true

  field :comment, Types::CommentType, null: true

  def resolve(arguments)
    comment = Comment.new(arguments)
    comment.user = context[:current_user]
    # TODO: raise Pundit::NotAuthorizedError unless CommentPolicy.new(context[:current_user], Comment).create?

    if comment.save!
      {
        comment: comment,
      }
    end
  end
end
