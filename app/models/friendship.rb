class Friendship < ApplicationRecord
  belongs_to :friend, class_name: ‘User’, foreign_key: ‘friend_id’
  belongs_to :user, class_name: ‘User’, foreign_key: ‘user_id’
  scope :friends, -> { where(‘confirmed =?’, true) }
  scope :not_friends, -> { where(‘confirmed =?’, false) }
end
