# frozen_string_literal: true

class User < ApplicationRecord
  self.primary_key = :uuid

  validates_uniqueness_of :email
  validates_uniqueness_of :phone_number, allow_blank: true
  validates_uniqueness_of :username
  mount_base64_uploader :avatar, AvatarUploader

  has_one :moderator
  has_many :tasks
  has_many :sessions
  has_many :articles
  has_many :media, dependent: :destroy
  has_many :gardens, dependent: :destroy
  has_and_belongs_to_many :rooms

  has_and_belongs_to_many :friendships,
                          class_name: 'User',
                          join_table: :friendships,
                          foreign_key: :user_id,
                          association_foreign_key: :friend_user_id
end
