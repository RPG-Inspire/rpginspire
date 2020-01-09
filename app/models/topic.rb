class Topic < ApplicationRecord
  default_scope -> { where.not(user_id: nil) }
  has_and_belongs_to_many :tags
  belongs_to :user, optional: true
  has_many :votes
  has_many :comments

  scope :is_draft, -> { where(user_id: nil) }
  scope :by_tag_titles, -> (tag_title_list) { joins(:tags).where(tags: {title: tag_title_list}) }
  scope :draft_by_id, -> (draft_id) { where(user_id: nil, id: draft_id) }

  mount_uploader :image, TopicImageUploader

  before_create :set_slug

  def score
    votes.inject(0) { |sum, vote| sum + vote.vote_weight }
  end

  def has_upvote_from(user_id)
    votes.upvote_from_user(user_id).exists?
  end

  def set_slug
    self.slug = self.title.parameterize if self.slug.nil?
  end

  def is_link?
    self.link.present? && self.body.nil?
  end

  def description
    sanitized_body = ActionView::Base.full_sanitizer.sanitize(self.body) || ''
    sanitized_body[0..140]
  end

  def keywords
    self.tags.map {|t| t.title }.join(', ')
  end
end

