class Plant < ApplicationRecord
  self.primary_key = :uuid

  mount_base64_uploader :photo, PhotoUploader

end
