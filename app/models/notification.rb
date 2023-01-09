class Notification < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :actor, class_name: "User"
  belongs_to :notifiable, polymorphic: true
  belongs_to :actionable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
  scope :unread_count, -> { unread.count }
  scope :ordered_by_latest, -> { order(created_at: :desc)}
  scope :recent, -> { ordered_by_latest.limit(5) }

  after_create_commit do
   broadcast_replace_to recipient, target: "recentNotifications", partial: "notifications/recent", locals: { notifications: recipient.notifications }
   broadcast_replace_to recipient, target: "unreadNotificationsCount", partial: "notifications/unread_count", locals: { unread_count: recipient.notifications.unread_count }
  end
end
