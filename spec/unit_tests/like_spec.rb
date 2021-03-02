require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { User.new(name: 'Robert', email: 'robert@rob.com', password: '123456', id: 1) }
  let(:post) { Post.new(content: 'My first post', user_id: 1, id: 1) }
  let(:like) { Like.new(user_id: 1, post_id: 1, id: 1) }

  context 'association' do
    it 'belongs to user' do
      should belong_to(:user)
    end

    it 'belongs to post' do
      should belong_to(:post)
    end
  end
end