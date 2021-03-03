class FriendshipsController < ApplicationController
  include ApplicationHelper

  before_action :set_friendship, only: [:show, :destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
    @friends = current_user.friends
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)

    respond_to do |format|
      if @friendship.save
        format.html { redirect_back fallback_location: @users, :notice => 'Friend request sent succesfully.' }
      else
        format.html { redirect_back fallback_location: @users, :notice => 'Unable to add friend.' }
      end
    end
  end

  def accept_friendship
    @friendship = Friendship.find_by(friendship_params)
    return unless @friendship
  
    @friendship.confirmed = true
    @friends = current_user.friends
    if @friendship.save
      redirect_to friendships_path(@user), notice: 'Friend Request Accepted!'
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find_by(friendship_params)
    return unless @friendship

    @friendship.confirmed = false
    @friendship.destroy
    redirect_to friendships_path(@user), notice: 'Friend Request Not Accepted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.fetch(:friendship, {})
    end
end
