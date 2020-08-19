require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'validation tests'

  before :each do
    @user = User.create(name: 'paul', email: 'paulo@microverse.org', password: 'password')
    @post = Post.create(user_id: @user.id, content: 'This is is a post')
  end

  it 'should successfully initialize and create a like' do
    like = Like.new(user_id: @user.id, post_id: @post.id)
    expect(like.save).to eq(true)
  end
end
