include Resolvers::Queries::MemoQueries

module Types
  module Query
    MemoQuery = GraphQL::ObjectType.define do
      name 'MemoQuery'

      field :getMemo, function: GetMemo.new
      field :getMemos, function: GetMemos.new
      connection :getUserMemos, function: GetUserMemos.new
    end
  end
end
