class Vote < ApplicationRecord
  enum vote_type: {upvote: 1, neutral: 0}

  belongs_to :user
  belongs_to :topic

  scope :find_vote, -> (topic_id, user_id) { where(topic_id: topic_id, user_id: user_id) }
  scope :by_user, -> (user_id) { where(user_id: user_id) }
  scope :upvote_from_user, -> (user_id) { upvote.by_user(user_id) }

  after_save :calculate_topic_score

  def self.find_vote!(topic_id, user_id)
    find_vote(topic_id, user_id).first
  end

  def upvote
    self.vote_type = :upvote
  end

  def reclaim_vote
    self.vote_type = :neutral
  end

  def vote_weight
    self.vote_type == "upvote" ? 1 : 0
  end

  def calculate_topic_score
    topic.calc_score
    topic.save
  end
end
