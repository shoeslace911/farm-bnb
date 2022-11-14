class AddIsUserToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_user, :boolean
  end
end
