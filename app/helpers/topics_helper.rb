module TopicsHelper

  def claim_draft
    unless session[:topic_draft_id].nil?
      Actions::Registration.claim_draft(session[:topic_draft_id], resource)&.save
      session[:topic_draft_id] = nil
    end
  end
end
