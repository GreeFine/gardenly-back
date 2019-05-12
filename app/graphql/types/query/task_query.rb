include Resolvers::Queries::TaskQueries

module Types
  module Query
    TaskQuery = GraphQL::ObjectType.define do
      name 'TaskQuery'

      field :getTask, function: GetTask.new
      field :getTasks, function: GetTasks.new

    end
  end
end
