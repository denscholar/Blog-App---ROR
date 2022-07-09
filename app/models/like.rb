class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  # A method that updates the likes counter for a post.

  def update_likes_counter
    post.increment!(:likesCounter)
  end
end
