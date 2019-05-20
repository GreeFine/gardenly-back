# frozen_string_literal: true

module Types
  class SubscriptionType < Types::BaseObject
    field :chat_subscription, Types::MessageType, null: true, description: 'A new message was sent'

    def chat_subscription; end
  end
end
