require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests'

  before :each do
    @user = User.create(name: 'paul', email: 'paulo@microverse.org', password: 'password')
    @post = Post.create(user_id: @user.id, content: 'This is is a post')
  end

  it 'should ensure a comment is present' do
    comment = Comment.new(user_id: @user.id, post_id: @post.id, content: nil)
    expect(comment.save).to eq(false)
  end

  it 'should ensure user_id is present' do
    comment = Comment.new(user_id: nil, post_id: @post.id, content: 'This is is a comment')
    expect(comment.save).to eq(false)
  end

  it 'should ensure post_id is present' do
    comment = Comment.new(user_id: @user.id, post_id: nil, content: 'This is a comment')
    expect(comment.save).to eq(false)
  end

  it 'should ensure name has maximum 200 characters' do
    comment = Comment.new(user_id:  @user.id, post_id:  @post.id, content: 'This is a comment'*20)
    expect(comment.save).to eq(false)
  end

  it 'should successfully initialize comment if validation requirements are met' do
    comment = Comment.new(user_id:  @user.id, post_id:  @post.id, content: 'This is a comment')
    expect(comment.save).to eq(true)
  end
end
