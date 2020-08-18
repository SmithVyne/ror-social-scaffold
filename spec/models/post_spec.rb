require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validation tests'

  before :each do
    @user = User.create(name: 'paul', email: 'paulo@microverse.org', password: 'password')
  end

  it 'should ensure a post is not blank' do
    post = Post.new(user_id: @user.id, content: nil)
    expect(post.save).to eq(false)
  end

  it 'should ensure user_id is present' do
    post = Post.new(user_id: nil, content: 'This is is a post')
    expect(post.save).to eq(false)
  end

  it 'should ensure post has maximum 200 characters' do
    post = Post.new(user_id:  @user.id, content: 'This is a post'*100)
    expect(post.save).to eq(false)
  end

  it 'should successfully initialize post if validation requirements are met' do
    post = Post.new(user_id:  @user.id, content: 'This is a post')
    expect(post.save).to eq(true)
  end
end
