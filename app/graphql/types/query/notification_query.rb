include Resolvers::Queries::NotificationQueries

module Types
  module Query
    NotificationQuery = GraphQL::ObjectType.define do
      name 'NotificationQuery'

      field :getNotification, function: GetNotification.new
      field :getNotifications, function: GetNotifications.new
      connection :getUserNotifications, function: GetUserNotifications.new
    end
  end
end
