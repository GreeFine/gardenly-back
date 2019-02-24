include Resolvers::Queries::ArticleQueries

module Types
  module Query
    ArticleQuery = GraphQL::ObjectType.define do
      name 'ArticleQuery'

      field :getArticle, function: GetArticle.new
      field :getArticles, function: GetArticles.new
      connection :getAllArticles, function: GetAllArticles.new
      connection :getAllUserArticles, function: GetAllUserArticles.new
    end
  end
end
