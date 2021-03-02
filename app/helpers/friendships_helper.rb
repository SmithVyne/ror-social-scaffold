module FriendshipsHelper
  def show_friendship_btn
    return if Friendship.find_by(user_id: current_user.id, friend_id: @user.id) || Friendship.find_by(user_id: @user.id, friend_id: current_user.id)

    link_to 'Add Friend', friendships_path(:friend_id => @user.id), method: :post, class: 'btn btn-success pt-2' unless current_user.id == @user.id
  end

  def index_friendship_btn(user)
    return if Friendship.find_by(user_id: current_user.id, friend_id: user.id) || Friendship.find_by(user_id: user.id, friend_id: current_user.id)

    link_to 'Add Friend', friendships_path(:friend_id => user.id), method: :post, class: 'mb-2 btn-sm btn btn-success' unless current_user.id == user.id
  end

  def show_friend_requests
    return unless current_user == @user

    render 'users/show_friend_requests'
  end
end
