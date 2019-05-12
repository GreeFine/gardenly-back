class Garden < ApplicationRecord
  self.primary_key = :uuid

  validates_uniqueness_of :name, scope: :user
  has_many :tiles, dependent: :destroy
  belongs_to :user
end
