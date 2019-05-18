# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :on_article, Types::MessageType, null: true, description: 'A new article was sent'

    def on_article; end
  end
end
