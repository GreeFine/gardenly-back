module Types
  class MutationType < Types::BaseObject
    field :create_session, mutation: Mutations::CreateSession
    field :delete_session, mutation: Mutations::DeleteSession
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :update_medium, mutation: Mutations::UpdateMedium
    field :create_medium, mutation: Mutations::CreateMedium
    field :delete_medium, mutation: Mutations::DeleteMedium
    field :create_garden, mutation: Mutations::CreateGarden
    field :update_garden, mutation: Mutations::UpdateGarden
    field :create_article, mutation: Mutations::CreateArticle
    field :create_comment, mutation: Mutations::CreateComment
    field :create_review, mutation: Mutations::CreateReview
    field :create_room, mutation: Mutations::CreateRoom
    field :create_message, mutation: Mutations::CreateMessage
  end
end
