class Comment < ApplicationRecord
  self.primary_key = :uuid
  after_create :send_notification
  after_destroy :remove_notification

  belongs_to :user
  belongs_to :article

  def send_notification
    Notification.create!(user: self.article.user, body: "#{self.user.username} commented on your article '#{self.article.title}'", object_type: "Comment", object_type_id: self.uuid)
  end

  def remove_notification
    Notification.find_by(object_type: "Comment", object_type_id: self.uuid).destroy
  end
end
