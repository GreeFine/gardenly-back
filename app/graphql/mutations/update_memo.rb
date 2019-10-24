class Mutations::UpdateMemo < Mutations::BaseMutation
  argument :id, ID, required: true
  argument :body, String, required: true

  field :memo, Types::MemoType, null: true

  def resolve(arguments)
    memo = Memo.find(arguments[:id])
    memo.assign_attributes(arguments)

    memo.save!
    {
      memo: memo
    }
  end
end
