class Garden < ApplicationRecord
  self.primary_key = :uuid

  extend FriendlyId
  friendly_id :slug_candidates, use: [:scoped, :slugged], scope: :user

  validates_uniqueness_of :name, scope: :user
  has_many :tiles, dependent: :destroy
  belongs_to :user

  def slug_candidates
    [
      :name,
      [:name, "#{Garden.where(user: self.user, name: name).count + 1}"]
    ]
  end
end
