class Question < ApplicationRecord
  belongs_to :questioner, class_name: "User", foreign_key: "user_id"
  belongs_to :subject
  has_many :votes
  has_many :comments, as: :commentable, dependent: :delete_all
  has_many :answers
  has_many :follows, as: :followable, dependent: :delete_all
  has_many :followers, through: :follows, source: :user

  has_rich_text :body

  validates :title, presence: true, length: { minimum: 15, maximum: 150 }
  include BodyValidations

  scope :recent, -> { order(created_at: :desc) }
  scope :most_votes, -> { order(votes_count: :desc)}

  after_create do
    # questioner automatically follows their new question
    follows.create(user: questioner)
  end

  def slug
    title.parameterize
  end

  def voted?(user)
    votes.exists?(user: user)
  end 

  def user_vote(user)
    votes.find_by(user: user)
  end

  def following?(user)
    follows.exists?(user: user)
  end
end
