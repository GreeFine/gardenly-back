module Resolvers
  module Queries
    module ArticleQueries
      class GetArticle < GraphQL::Function
        description 'Get an Article by id'
        type Types::ArticleType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Article.find(args[:id])
        end
      end

      class GetArticles < GraphQL::Function
        description 'Get multiple Articles by ids'
        type types[Types::ArticleType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Article.find(args[:ids])
        end
      end

      class GetAllArticles < GraphQL::Function
        description 'Get all Articles'
        type Types::ArticleType.connection_type

        def call(obj, args, ctx)
          Article.all
        end
      end

      class GetAllUserArticles < GraphQL::Function
        description 'Get all User Articles' #  FIXME: Same as above, supode to be users
        type Types::ArticleType.connection_type

        def call(obj, args, ctx)
          Article.all
        end
      end

    end
  end
end
