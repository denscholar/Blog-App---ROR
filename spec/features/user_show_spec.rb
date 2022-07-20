require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before :all do
    User.destroy_all
    Post.destroy_all
    @user = User.create(name: 'Dennis', email: 'Dennis@gmail.com', bio: "This is Dennis's bio", password: 'password',
                        role: 'admin', confirmed_at: Time.now)

    Post.create(user: @user, title: 'post A Dennis', text: 'text A', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user, title: 'post B Dennis', text: 'text B', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user, title: 'post C Dennis', text: 'text C', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user, title: 'post D Dennis', text: 'text D', comments_counter: 0, likes_counter: 0)
    @post = Post.create(user: @user, title: 'post E Dennis', text: 'text E', comments_counter: 0, likes_counter: 0)
  end

  before :each do
    visit new_user_session_path
    fill_in 'user[email]', with: 'Dennis@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'

    visit user_path @user
  end

  context '#Get' do
    it 'should display the profile picture of the user' do
      photos = page.all('img')
      expect(photos.count).to eq(1)
    end

    it 'should display the username of the user' do
      expect(page).to have_text('Dennis')
    end

    it 'should display the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 5')
    end

    it 'should display the bio of the user' do
      expect(page).to have_text("This is Dennis's bio")
    end

    it "should display the user's first 3 posts" do
      expect(page).to have_text 'post E Dennis'
      expect(page).to have_text 'post D Dennis'
      expect(page).to have_text 'post C Dennis'
    end

    it "should display the button that lets me view all of a user's posts" do
      see_all_link = find_link(href: user_posts_path(@user.id))
      expect(see_all_link).to_not be_nil
      expect(page).to have_text 'See all posts'
    end
  end

  context '#Post' do
    it "should redirect to post's show page by clicking on a given post" do
      click_link(id: "link_post-#{@post.id}")
      expect(current_path).to eq(user_post_path(user_id: @user.id, id: @post.id))
    end

    it "should redirect to the user's posts index page by clicking on button See all posts" do
      click_link(href: user_posts_path(@user.id))
      expect(current_path).to eq(user_posts_path(@user.id))
    end
  end
end
