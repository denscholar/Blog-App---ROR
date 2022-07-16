class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :id, :user_id
    rename_column :posts, :user_id, :user_id
    rename_column :comments, :user_id, :user_id
    rename_column :likes, :user_id, :user_id
  end
end
