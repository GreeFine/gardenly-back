# frozen_string_literal: true

class Room < ApplicationRecord
  self.primary_key = :uuid

  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :users
end
