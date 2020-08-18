require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation tests'

  before :each do
    @user = User.new(name: 'paul', email: 'paulo@microverse.org', password: 'password')
    @post = Post.new(content: 'This is is a post')
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

end
