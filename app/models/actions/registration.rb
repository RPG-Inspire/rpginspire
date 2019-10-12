module Actions::Registration

  def self.invalidate_resources_cache_of(user)
    Actions::Topic.invalidate_cache(user.topics.pluck(:id)) unless user.saved_changes.empty?
  end

  def self.find_or_create_from_auth_hash(auth_hash)
    email = auth_hash[:info][:email]
    user = User.from_oauth(auth_hash[:provider], email).first

    if !user.nil?
      return :success, user
    elsif User.by_email(email).exists?
      return :invalid_provider, nil
    else
      return :success, create_from_auth_hash(auth_hash)
    end
  end

  def self.register_from_oauth(auth_hash, draft_id)
    status, user = find_or_create_from_auth_hash(auth_hash)

    if status == :success && !draft_id.nil?
      claim_draft(draft_id, user)
    end

    return status, user
  end

  def self.create_from_auth_hash(auth_hash)
    User.create({
      provider: auth_hash[:provider],
      name: auth_hash[:info][:nickname],
      email: auth_hash[:info][:email],
      password: SecureRandom.hex(16)
    })
  end

  def self.claim_draft(topic_draft_id, user)
    topic = Topic.unscoped.draft_by_id(topic_draft_id).first
    unless topic.nil?
      topic.user = user
      topic.save
    end
    false
  end
end

