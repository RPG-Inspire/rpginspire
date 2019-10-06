module Actions::Registration

  def self.claim_draft(topic_draft_id, resource)
    topic = Topic.unscoped.draft_by_id(topic_draft_id).first
    unless topic.nil?
      topic.user = resource
      topic
    end
  end
end

