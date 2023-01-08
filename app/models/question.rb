class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: "user_id"
  belongs_to :subject
  has_many :votes
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :answers

  has_rich_text :body

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  include BodyValidations

  scope :recent, -> { order(created_at: :desc) }
  scope :most_votes, -> { order(votes_count: :desc)}

  def slug
    title.parameterize
  end

  def voted?(user)
    votes.exists?(user: user)
  end 

  def user_vote(user)
    votes.find_by(user: user)
  end
end
