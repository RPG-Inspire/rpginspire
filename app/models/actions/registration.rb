module Actions::Registration

  def self.invalidate_resources_cache_of(user)
    Actions::Topic.invalidate_cache(user.topics.pluck(:id)) unless user.saved_changes.empty?
  end

  def self.claim_draft(topic_draft_id, user)
    topic = Topic.unscoped.draft_by_id(topic_draft_id).first
    unless topic.nil?
      topic.user = user
      topic
    end
  end
end

