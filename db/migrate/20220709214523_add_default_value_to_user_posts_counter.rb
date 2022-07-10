class AddDefaultValueToUserPostsCounter < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :postsCounter, :integer, default: 0
  end
  
  def down
    change_column :users, :postsCounter, :integer, default: 0
  end
end
