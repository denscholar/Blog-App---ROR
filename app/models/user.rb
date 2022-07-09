class User < ApplicationRecord
  has_many :posts, class_name: 'Post', foreign_key: 'author_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id'

  # PostsCounter must be an integer greater than or equal to zero.
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Name must not be blank.
  validates :name, presence: true

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
