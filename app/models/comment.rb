class Comment < ApplicationRecord
  self.primary_key = :uuid

  belongs_to :user
  belongs_to :article
end
