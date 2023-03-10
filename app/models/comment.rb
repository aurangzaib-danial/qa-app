class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commentator, class_name: "User", foreign_key: "user_id"

  validates :body, presence: true
end
