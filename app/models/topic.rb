class Topic < ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :user, optional: true
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

