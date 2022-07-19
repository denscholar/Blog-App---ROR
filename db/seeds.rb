# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
# second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

# User
# first_user = User.create!(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', posts_counter: 0, bio: 'Teacher from Mexico.')
# second_user = User.create!(name: 'John Smith', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', posts_counter: 0, bio: 'Doctor from Spain.')
# third_user = User.create!(name: 'Noah', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', posts_counter: 0, bio: 'Doctor from Mexico.')
# fourth_user = User.create!(name: 'Ann Charlotte', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1', posts_counter: 0, bio: 'Teacher from Mexico.')

# Posts
# first_post = Post.create!(user_id: first_user.id, title: 'Hello', text: 'I am the first user', comments_counter: 0, likes_counter: 0,)
# second_post = Post.create!(user_id: second_user.id, title: 'Hi', text: 'I am the second user', comments_counter: 0, likes_counter: 0,)
# third_post = Post.create!(user_id: third_user.id, title: 'Hi there', text: 'I am the third user', comments_counter: 0, likes_counter: 0,)
# fourth_post = Post.create!(user_id: fourth_user, title: 'Hello!', text: 'I am the forth user', comments_counter: 0, likes_counter: 0,)

# Comments
# Comment.create!(post_id: first_post.id, user_id: first_user.id, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
# Comment.create!(post_id: first_post.id, user_id: second_user.id, text: 'Hi Tom!')
# Comment.create!(post_id: first_post.id, user_id: first_user.id, text: 'Great Post')
# Comment.create!(post_id: second_post.id, user_id: fourth_user.id, text: 'Nice Content, Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.')
# Comment.create!(post_id: third_post.id, user_id: third_user.id, text: 'Hello there!')
# Comment.create!(post_id: first_post.id, user_id: first_user.id, text: 'Hi, Lorem ipsum dolor sit amet')
# Comment.create!(post_id: first_post.id, user_id: first_user.id, text: 'Hello, Lorem ipsum dolor sit amet')
# Comment.create!(post_id: fourth_post.id, user_id: first_user.id, text: 'Like the post, Lorem ipsum dolor sit amet')
# Comment.create!(post_id: first_post.id, user_id: first_user.id, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')
# Comment.create!(post_id: first_post.id, user_id: first_user.id, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')