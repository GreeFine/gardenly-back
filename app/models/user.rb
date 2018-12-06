class User < ApplicationRecord
  self.primary_key = :uuid
  validates_uniqueness_of :email

  has_many :sessions
end
