class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: "user_id"
  belongs_to :subject

  has_rich_text :body

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  include BodyValidations

  def slug
    title.parameterize
  end
end
