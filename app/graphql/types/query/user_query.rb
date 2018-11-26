include Resolvers::Queries::UserQueries

module Types
  module Query
    UserQuery = GraphQL::ObjectType.define do
      name 'UserQuery'

      field :getUser, function: GetUser.new
      field :getUsers, function: GetUsers.new
      connection :getAllUsers, function: GetAllUsers.new

      field :getCurrentUser, function: GetCurrentUser.new
    end
  end
end
