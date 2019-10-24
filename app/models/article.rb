# frozen_string_literal: true

class Article < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :user
  has_many :comments
  has_many :reviews

  # after_commit :notify_subscriber_of_addition

  private

  # def notify_subscriber_of_addition
  #   GardenlySchema.subscriptions.trigger('on_article', {}, self)
  # end
end
