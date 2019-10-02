class Topic < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  has_many :votes
  has_many :comments

  mount_uploader :image, TopicImageUploader

  def score
    votes.sum(:vote_type)
  end

  def has_upvote_from(user_id)
    votes.upvote_from_user(user_id).exists?
  end
end

