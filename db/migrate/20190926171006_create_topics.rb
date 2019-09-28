class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :slug
      t.string :link
      t.string :image
      t.text :body
      t.boolean :own_creative_rights
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end

