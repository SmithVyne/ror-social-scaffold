class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @users = User.all
    @posts = @user.posts.ordered_by_most_recent
    @friends = current_user.friends
    # Users who have yet to confirm friend requests
    @pending_friend_responses = current_user.pending_friend_responses
    # Users who have requested to be friends
    #@pending_friend_requests = current_user.pending_friend_requests
  end
end
