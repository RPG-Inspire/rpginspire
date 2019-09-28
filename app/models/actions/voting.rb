module Actions::Voting

  def self.upvote_topic(topic, user)
    vote = find_or_new_vote(topic, user)
    vote.upvote
    vote
  end

  def self.new_vote(topic, user)
    Vote.new(topic: topic, user: user)
  end

  def self.reclaim_vote(topic, user)
    vote = find_or_new_vote(topic, user)
    vote.reclaim_vote
    vote
  end

  def self.find_or_new_vote(topic, user)
    Vote.find_vote!(topic.id, user.id) || new_vote(topic, user) 
  end
end

