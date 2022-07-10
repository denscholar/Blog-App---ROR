class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  # A method that updates the comments counter for a post.
  after_save :update_comments_counter
  
  def update_comments_counter
    post.increment!(:commentsCounter)
  end
end
