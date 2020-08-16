class FriendshipsController < ApplicationController

  def index
    @friends = current_user.friends
    @pending_friends = current_user.pending_friends
    @friend_requests =  current_user.friend_requests
  end

  def invite
    @friendship = current_user.friendships.new(invitee_id: params[:id])

    if @friendship.save
      redirect_to friends_path
    end
  end

  def accept
    this_friendship = Friendship.where(inviter_id: params[:id], invitee_id: current_user.id)
    this_friendship.update(status: true)

    redirect_to friends_path
  end
end
