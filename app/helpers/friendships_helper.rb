module FriendshipsHelper
  def show_friendship_btn
    link_to 'Add Friend', friendships_path(:friend_id => @user.id), method: :post, class: 'btn btn-success pt-2' unless current_user.id == @user.id
  end

  def show_friend_requests
    return unless current_user == @user

    render 'users/show_friend_requests'
  end
end
