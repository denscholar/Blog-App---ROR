require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  before :all do
    User.destroy_all
    Post.destroy_all
    @user = User.create(name: 'Dennis', email: 'Dennis@gmail.com', bio: "This is Dennis's bio", password: 'password',
                        role: 'admin', confirmed_at: Time.now)
    @user_b = User.create(name: 'Peter', email: 'Peter@gmail.com', password: 'password', role: 'default',
                          confirmed_at: Time.now)
    @user_c = User.create(name: 'Any', email: 'any@gmail.com', password: 'password', role: 'default',
                          confirmed_at: Time.now)

    Post.create(user: @user, title: 'post A Dennis', text: 'text A', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user, title: 'post B Dennis', text: 'text B', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user, title: 'post C Dennis', text: 'text C', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user, title: 'post D Dennis', text: 'text D', comments_counter: 0, likes_counter: 0)
    @post = Post.create(user: @user, title: 'post E Dennis', text: 'text E', comments_counter: 0, likes_counter: 0)

    Comment.create(user: @user_b, post: @post, text: 'comment A')
    Comment.create(user: @user_b, post: @post, text: 'comment B')
    Comment.create(user: @user_b, post: @post, text: 'comment C')
    Comment.create(user: @user_b, post: @post, text: 'comment D')
    Comment.create(user: @user_c, post: @post, text: 'comment E')
    Comment.create(user: @user_c, post: @post, text: 'comment F')
    Comment.create(user: @user_c, post: @post, text: 'comment G')

    Like.create(user: @user, post: @post)
    Like.create(user: @user_b, post: @post)
    Like.create(user: @user_c, post: @post)
  end

  before :each do
    visit new_user_session_path
    fill_in 'user[email]', with: 'Dennis@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'

    visit user_path @user.id
    visit user_posts_path @user.id
    visit user_post_path @user.id, @post.id
  end

  context '#Get' do
    it "should display the post's title" do
      expect(page).to have_text('post E Dennis')
    end

    it 'should display whote the post' do
      expect(page).to have_text('by Dennis')
    end

    it "shoul display the post's number of comments" do
      comments_button = find_button("comments_post-#{@post.id}")
      expect(comments_button.text).to eq 'Comments: 7'
    end

    it "should display the post's number of likes" do
      likes_button = find_button("likes_post-#{@post.id}")
      expect(likes_button.text).to eq 'Unlike: 3'
    end

    it "should display the post's body" do
      expect(page).to have_text('text E')
    end

    it "should display the post's commentors' names" do
      any_posts = page.all('h4', text: 'Any:')
      expect(any_posts.count).to eq 0
    end

    it "should display the pos's commentors' comments" do
      expect(page).to have_text 'comment A'
      expect(page).to have_text 'comment B'
      expect(page).to have_text 'comment C'
      expect(page).to have_text 'comment D'
      expect(page).to have_text 'comment E'
      expect(page).to have_text 'comment F'
      expect(page).to have_text 'comment G'
    end
  end
end
