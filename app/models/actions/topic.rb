class Actions::Topic
  def self.invalidate_cache(topic_id)
    Topic.where(id: topic_id).update_all(updated_at: Time.now)
  end

  def self.retrieve_topics(tag_title_list = [], page = 1, per = 20)
    topics = Topic.includes(:tags, :votes, :user)
    topics = topics.by_tag_titles(tag_title_list) unless tag_title_list.empty?
    topics.order(id: :desc).page(page).per(per)
  end
end

