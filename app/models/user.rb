class User < ApplicationRecord
  self.primary_key = :uuid

  has_many :sessions
end
