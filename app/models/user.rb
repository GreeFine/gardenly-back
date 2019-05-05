class User < ApplicationRecord
  self.primary_key = :uuid

  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number, :allow_blank => true
  validates_uniqueness_of :username
  mount_base64_uploader :avatar, AvatarUploader

  has_one :moderator
  has_many :sessions
  has_many :media, dependent: :destroy
  has_many :gardens, dependent: :destroy
end
