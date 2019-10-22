class Mutations::DeleteMemo < Mutations::BaseMutation
  argument :id, ID, required: true

  field :memo, Types::MemoType, null: true

  def resolve(arguments)
    memo = Memo.find(arguments[:id])

    memo.destroy!
    {
      memo: memo
    }
  end
end
