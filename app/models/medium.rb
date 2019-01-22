class Medium < ApplicationRecord
  self.primary_key = :uuid
  belongs_to :user
  
  validates :picture, presence: true
  validates :title, presence: true

  mount_base64_uploader :picture, PictureUploader

end
