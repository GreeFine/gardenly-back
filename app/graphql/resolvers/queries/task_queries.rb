module Resolvers
  module Queries
    module TaskQueries
      class GetTask < GraphQL::Function
        description 'Get an Task by id'
        type Types::TaskType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Task.find(args[:id])
        end
      end

      class GetTasks < GraphQL::Function
        description 'fetch les tasks du user en cours'
        type types[Types::TaskType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Task.where(user: ctx[:current_user], public: true, status: "New")
        end
      end

    end
  end
end
