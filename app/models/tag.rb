class Tag < ApplicationRecord
  enum tag_type: {system: 1, category: 2}
end
