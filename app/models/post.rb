class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'post_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'post_id'

  # CommentsCounter must be an integer greater than or equal to zero.
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Title must not be blank. Title must not exceed 250 characters.
  validates :title, length: { maximum: 250 }, presence: true

  # LikesCounter must be an integer greater than or equal to zero.
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  # A method which returns the 5 most recent comments for a given post.
  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  # A method that updates the posts counter for a user.
  def update_post_counter
    author.increment!(:posts_counter)
  end
end
