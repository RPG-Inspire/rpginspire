class AddScoreSumCacheFieldToTopics < ActiveRecord::Migration[6.0]
  def change
    add_column :topics, :score_sum_cache, :integer, default: 0
  end
end
