module Resolvers
  module Queries
    module MemoQueries
      class GetMemo < GraphQL::Function
        description 'Get an Memo by id'
        type Types::MemoType

        argument :id, !types.ID

        def call(obj, args, ctx)
          Memo.find(args[:id])
        end
      end

      class GetMemos < GraphQL::Function
        description 'Get multiple Memos by ids'
        type types[Types::MemoType]

        argument :ids, !types[types.ID]

        def call(obj, args, ctx)
          Memo.find(args[:ids])
        end
      end

      class GetUserMemos < GraphQL::Function
        description 'Get all Memos'
        type Types::MemoType.connection_type

        def call(obj, args, ctx)
          Memo.where(user: ctx[:current_user]).order(created_at: :desc)
        end
      end

    end
  end
end
