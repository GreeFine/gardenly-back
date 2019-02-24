module Types
  class ReviewType < Types::BaseObject
    description "Review object"
    field :id, ID, null: false
    field :article, Types::ArticleType, null: false
    field :user, Types::UserType, null: false
    field :vote, Boolean, null: false
  end
end
