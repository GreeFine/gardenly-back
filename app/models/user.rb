class User < ApplicationRecord
  self.primary_key = :uuid

  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number
  validates_uniqueness_of :username

  has_many :sessions
  has_many :gardens
end
