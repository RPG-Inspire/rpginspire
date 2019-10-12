module TopicsHelper

  def claim_draft
    unless session[:topic_draft_id].nil?
      Actions::Registration.claim_draft(topic_draft_id, resource)
      erase_draft
    end
  end

  def erase_draft
    session[:topic_draft_id] = nil
  end

  def topic_draft_id
    session[:topic_draft_id]
  end
end
