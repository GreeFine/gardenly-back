require 'time'

Types::ActiveRecordInterface = GraphQL::InterfaceType.define do
  name "ActiveRecord"
  description "Active Record Interface"

  field :id do
    description 'ID of the element in the database'
    type types.ID

    resolve -> (obj, args, ctx) {
      obj.id
    }
  end

  field :updated_at do
    description 'Datetime of the last update on the element formatted to rfc2822'
    type types.String

    resolve -> (obj, args, ctx) {
      obj.updated_at&.rfc2822
    }
  end

  field :created_at do
    description 'Datetime of the creation of the element formatted to rfc2822'
    type types.String

    resolve -> (obj, args, ctx) {
      obj.created_at&.rfc2822
    }
  end
end
