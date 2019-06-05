module Resolvers
  module Queries
    module ArticleQueries
      class GetArticle < GraphQL::Function
        description 'Get an Article by id'
        type Types::ArticleType

        argument :id, !types.ID

        def call(_obj, args, _ctx)
          Article.find(args[:id])
        end
      end

      class GetArticles < GraphQL::Function
        description 'Get multiple Articles by ids'
        type types[Types::ArticleType]

        argument :ids, !types[types.ID]

        def call(_obj, args, _ctx)
          Article.find(args[:ids])
        end
      end

      class GetAllArticles < GraphQL::Function
        description 'Get all Articles'
        type Types::ArticleType.connection_type

        def call(_obj, _args, _ctx)
          Article.all
        end
      end

      class GetAllUserArticles < GraphQL::Function
        description 'Get all User Articles'
        type Types::ArticleType.connection_type

        def call(_obj, _args, ctx)
          return GraphQL::ExecutionError.new('user_no_logon') if ctx[:current_user].nil?

          ctx[:current_user].articles
        end
      end
    end
  end
end
