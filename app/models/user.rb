class User < ApplicationRecord
    has_many :posts
    has_many :comments, class_name: "Comment", foreign_key: "user_id"
    has_many :likes, class_name: "Like", foreign_key: "user_id"
end
