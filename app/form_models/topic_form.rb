class TopicForm
  include ActiveModel::Model
  validates :title, presence: true
  attr_accessor :topic

  delegate *::Topic.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :topic

  def initialize(topic_attributes, user = nil, topic = nil)
    @topic = topic || Topic.new
    @topic.attributes = topic_attributes
    @topic.user = user
  end
end

