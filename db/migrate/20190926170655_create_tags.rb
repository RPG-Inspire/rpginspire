class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :title
      t.string :slug
      t.integer :tag_type

      t.timestamps
    end
  end
end
