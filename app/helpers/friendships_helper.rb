module FriendshipsHelper
  def show_friendship_btn
    link_to 'Add Friend', friendships_path(:friend_id => @user.id), method: :post, class: 'btn btn-success' unless current_user.id == @user.id
  end
end
