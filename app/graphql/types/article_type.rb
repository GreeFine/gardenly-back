module Types
  class ArticleType < Types::BaseObject
    description "Article object"
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :title, String, null: false
    field :comments, [Types::CommentType], null: true
    field :reviews, [Types::ReviewType], null: true
    field :content, String, null: false
  end
end
