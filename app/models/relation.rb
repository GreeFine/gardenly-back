class Relation < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'
  validates_uniqueness_of :friend, scope: :user
end
