class AddShouldNotifyActivityFieldToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :should_notify_activity, :boolean
  end
end
