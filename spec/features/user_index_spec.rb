require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before :all do
    User.destroy_all
    Post.destroy_all
    @user_a = User.create(name: 'Dennis', email: 'Dennis@gmail.com', password: 'password', role: 'admin',
                          confirmed_at: Time.now)
    @user_b = User.create(name: 'Peter', email: 'Peter@gmail.com', password: 'password', role: 'default',
                          confirmed_at: Time.now)
    @user_c = User.create(name: 'Any', email: 'any@gmail.com', password: 'password', role: 'default',
                          confirmed_at: Time.now)

    Post.create(user: @user_a, title: 'post A Dennis', text: 'text A', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user_a, title: 'post B Dennis', text: 'text B', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user_b, title: 'post C Peter', text: 'text C', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user_c, title: 'post D Any', text: 'text D', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user_c, title: 'post E Any', text: 'text E', comments_counter: 0, likes_counter: 0)
    Post.create(user: @user_c, title: 'post F Any', text: 'text F', comments_counter: 0, likes_counter: 0)
  end

  before :each do
    visit new_user_session_path
    fill_in 'user[email]', with: 'Dennis@gmail.com'
    fill_in 'user[password]', with: 'password'
    click_button 'Log in'
  end

  context '#Get' do
    it 'should display the username of all other users' do
      expect(page).to have_text('Dennis')
      expect(page).to have_text('Peter')
      expect(page).to have_text('Any')
    end

    it 'should display the profile picture for each user' do
      photos = page.all('img')
      expect(photos.count).to eq(3)
    end

    it 'should display the number of posts each user has written' do
      expect(page).to have_content('Number of posts: 2')
      expect(page).to have_content('Number of posts: 1')
      expect(page).to have_content('Number of posts: 3')
    end
  end

  context '#Post' do
    it "should redirect to user's show page by clicking on that user" do
      click_link(id: "link_user-#{@user_a.id}")
      expect(current_path).to eq(user_path(@user_a.id))
    end
  end
end
