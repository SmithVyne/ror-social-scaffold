class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  def friends
    friends_arr = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_arr + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_arr.compact
  end

  # Users who have requested to be friends
  def pending_friend_requests
    inverse_friendships.map { |friendship| friendship.user if !friendship.confirmed }
    inverse_friendships.compact
  end
end
