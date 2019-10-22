class Mutations::CreateMemo < Mutations::BaseMutation
  argument :body, String, required: true

  field :memo, Types::MemoType, null: true

  def resolve(arguments)
    memo = Memo.new(arguments)
    memo.user = context[:current_user]

    if memo.save!
      {
        memo: memo,
      }
    end
  end
end
