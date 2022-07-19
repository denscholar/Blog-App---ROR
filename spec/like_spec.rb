# require 'rails_helper'

# RSpec.describe Like, type: :model do
#   describe 'Likes Validation' do
#     it 'likesCounterr should be one' do
#       user = User.new(name: 'Esther Alice', posts_counter: 0)
#       user.save

#       post = Post.new(title: 'Alice in wonderlands', text: 'Beware the Jabberwock, my son!', comments_counter: 1,
#                       likes_counter: 0, user_id: user.id)
#       post.save

#       like = Like.new(user_id: user.id, post_id: post.id)
#       like.save

#       expect(like.post.likesCounter).to eq(1)
#     end
#   end
# end
