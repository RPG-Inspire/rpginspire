class Actions::Topic
  def self.invalidate_cache(topic_id)
    Topic.where(id: topic_id).update_all(updated_at: Time.now)
  end
end

