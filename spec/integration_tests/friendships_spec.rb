require 'rails_helper'

RSpec.describe 'Friendship', type: :feature do
  let(:user1) { User.create(name: 'Richard', email: 'rick@user1.com', password: '123456', id: 1) }
  let(:user2) { User.create(name: 'Robert', email: 'robert@user2.com', password: '123456', id: 2) }
  let(:friendship) { Friendship.create(user_id: 1, friend_id: 2, confirmed: true, id: 1) }

  def login(user1)
    visit '/users/sign_in'
    fill_in 'Email', with: user1.email
    fill_in 'Password', with: user1.password
    click_button
  end

  def login(user2)
    visit '/users/sign_in'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button
  end

  context 'click on Add Friend button' do
    it 'displays Added friend alert' do
      login(user2)
      visit '/users'
      click_link 'Add Friend'
      page.should have_content('Added friend.')
    end
  end

  # describe 'see another user main page' do
  #   it 'displays recent posts from user' do
  #     user1.save
  #     user2.save
  #     login(user2)
  #     fill_in 'Add New Post', with: post.content
  #     click_button
  #     click_link 'Sign out'
  #     login(user1)
  #     visit '/users'
  #     first(".btn-outline-success").click
  #     page.should have_content('Recent posts:')
  #   end
  # end
end