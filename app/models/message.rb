# frozen_string_literal: true

class Message < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :user
  belongs_to :room

  after_commit :notify_subscriber_of_addition

  private

  def notify_subscriber_of_addition
    GardenlySchema.subscriptions.trigger('chat_subscription', {}, self)
  end
end
