require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation test'
  it 'should ensure name is present' do
    user = User.new(name: nil, email: 'paulo@microverse.org', password: 'password')
    expect(user.save).to eq(false)
  end

  it 'should ensure email is present' do
    user = User.new(name: 'paul', email: nil, password: 'password')
    expect(user.save).to eq(false)
  end

  it 'should ensure password is present' do
    user = User.new(name: 'paul', email: 'paulo@microverse.org', password: nil)
    expect(user.save).to eq(false)
  end

  it 'should ensure name has maximum twenty characters' do
    user = User.new(name: '0123456789012345678901', email: 'paulo@microverse.org', password: 'password')
    expect(user.save).to eq(false)
  end

  it 'should successfully initialize user if validation requirements are met' do
    user = User.new(name: 'paul', email: 'paulo@microverse.org', password: 'password')
    expect(user.save).to eq(true)
  end
end
