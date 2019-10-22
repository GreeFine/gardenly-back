module Resolvers
  module Queries
    module NotificationQueries
      class GetNotification < GraphQL::Function
        description 'Get an Notification by id'
        type Types::NotificationType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Notification.find(args[:id])
        end
      end

      class GetNotifications < GraphQL::Function
        description 'Get multiple Notifications by ids'
        type types[Types::NotificationType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Notification.find(args[:ids])
        end
      end

      class GetUserNotifications < GraphQL::Function
        description 'Get all Notifications'
        type Types::NotificationType.connection_type

        def call(obj, args, ctx)
          Notification.where(user: ctx[:current_user]).order(created_at: :desc)
        end
      end

    end
  end
end
