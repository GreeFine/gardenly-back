class Garden < ApplicationRecord
  self.primary_key = :uuid

  validates_uniqueness_of :name, scope: :user

  belongs_to :user
end
