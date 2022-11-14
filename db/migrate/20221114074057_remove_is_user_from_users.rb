class RemoveIsUserFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :is_user
  end
end
