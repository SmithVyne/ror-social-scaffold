class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, foreign_key: :inviter_id
  has_many :invitations, class_name: 'Friendship', foreign_key: :invitee_id

  # Well, these identify friends of the user
  has_many :accepted_friendships, -> { where status: true }, class_name: 'Friendship', foreign_key: 'inviter_id'
  has_many :accepted_friends, through: :accepted_friendships, source: :invitee

  has_many :accepted_invitations, -> { where status: true }, class_name: 'Friendship', foreign_key: 'invitee_id'
  has_many :accepted_inviters, through: :accepted_invitations, source: :inviter

  has_many :pending_friendships, -> { where status: false }, class_name: 'Friendship', foreign_key: 'inviter_id'
  has_many :pending_friends, through: :pending_friendships, source: :invitee

  has_many :friendship_requests, -> { where status: false }, class_name: 'Friendship', foreign_key: 'invitee_id'
  has_many :friend_requests, through: :friendship_requests, source: :inviter

  def friends
    (accepted_friends + accepted_inviters).compact
  end

  def friend?(user)
    friends.include?(user)
  end

  def accept_friend(inviterid)
    Friendship.create(inviter_id: id, invitee_id: inviterid, status: true)
    inviters_friendship = Friendship.where(inviter_id: inviterid, invitee_id: id)
    inviters_friendship.update(status: true)
  end

  def timeline_posts
    Post.where(user: (friends << self)).ordered_by_most_recent
  end
end
