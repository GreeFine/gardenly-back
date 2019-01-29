module Types
  class MutationType < Types::BaseObject
    field :create_session, mutation: Mutations::CreateSession
    field :delete_session, mutation: Mutations::DeleteSession
    field :create_user, mutation: Mutations::CreateUser
    field :update_user, mutation: Mutations::UpdateUser
    field :update_medium, mutation: Mutations::UpdateMedium
    field :create_medium, mutation: Mutations::CreateMedium
    field :delete_medium, mutation: Mutations::DeleteMedium
  end
end
