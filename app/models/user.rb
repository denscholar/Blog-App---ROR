class User < ApplicationRecord
  has_many :posts
  has_many :comments, class_name: 'Comment', foreign_key: 'user_id'
  has_many :likes, class_name: 'Like', foreign_key: 'user_id'

  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
