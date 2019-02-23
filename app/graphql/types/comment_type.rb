module Types
  class CommentType < Types::BaseObject
    description "Comment object"
    field :id, ID, null: false
    field :article, Types::ArticleType, null: false
    field :user, Types::UserType, null: false
    field :content, String, null: false
  end
end
