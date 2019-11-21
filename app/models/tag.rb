class Tag < ApplicationRecord
  enum tag_type: {category: 1, tag: 2}
  has_and_belongs_to_many :topics

  def to_s
    "#{prefix}#{title}"
  end

  def print_type
    "#{prefix}#{tag_type}"
  end

  def prefix
    case self.tag_type
    when 'category'
      '@'
    when 'tag'
      '#'
    else
      '%'
    end
  end
end
