class ChangeAnimalsUser < ActiveRecord::Migration[7.0]
  def change
    change_column :animals, :user_id, :bigint, null: true
  end
end
