class Topic < ApplicationRecord
  belongs_to :tag
  belongs_to :user
  has_many :votes

  mount_uploader :image, TopicImageUploader

  def score
    votes.sum(:vote_type)
  end
end
