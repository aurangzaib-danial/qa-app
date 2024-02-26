class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :name, presence: true, format: { with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ }

  has_many :questions, inverse_of: "questioner"
  has_many :comments, inverse_of: "commentator"
  has_many :follows
  has_many :followed_questions, through: :follows, source: :followable, source_type: "Question"
  has_many :notifications, foreign_key: :recipient_id, inverse_of: :recipient

  def name_initial
    name[0].capitalize
  end

  def first_name
    name.split.first
  end

  def mark_notifications_as_read
    notifications.unread.update_all(read_at: Time.zone.now)
  end
end
