class AddShouldSendDigestFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :should_send_digest, :boolean, default: false
  end
end
