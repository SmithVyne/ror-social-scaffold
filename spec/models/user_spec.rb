require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test'
  it 'should initialize user' do
    user = User.new(name: 'paul', email: 'paulo@microverse.org', password: 'password')
    expect(user.save).to eq(true)
  end

  it 'should ensure name is present' do
    user2 = User.new(name: nil, email: 'paulo@microverse.org', password: 'password')
    expect(user2.save).to eq(false)
  end

  it 'should ensure name has maximum twenty characters' do
    user2 = User.new(name: '0123456789012345678901', email: 'paulo@microverse.org', password: 'password')
    expect(user2.save).to eq(false)
  end


end
