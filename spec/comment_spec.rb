# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   describe 'Comments Validation' do
#     it 'comments_counter should be two' do
#       user = User.new(name: 'Esther alice', posts_counter: 0)
#       user.save
#       post = Post.new(title: 'Alice in wonderlands', text: 'Alice in wonderlands', comments_counter: 0, likes_counter: 0,
#                       user_id: user.id)
#       post.save

#       comment = Comment.new(user_id: user.id, post_id: post.id)
#       comment.save

#       expect(comment.post.commentsCounter).to eq(2)
#     end
#   end
# end
