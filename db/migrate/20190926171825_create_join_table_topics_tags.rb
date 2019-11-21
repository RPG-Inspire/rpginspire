class CreateJoinTableTopicsTags < ActiveRecord::Migration[6.0]
  def change
    create_join_table :topics, :tags do |t|
      t.index [:topic_id, :tag_id]
      t.index [:tag_id, :topic_id]
    end
  end
end
