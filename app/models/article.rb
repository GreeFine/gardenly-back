class Article < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :user
  has_many :comments
  has_many :reviews
end
