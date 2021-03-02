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
    @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: params[:confirmed])

    respond_to do |format|
      if @friendship.save
        format.html { redirect_to @friendship, notice: 'Added friend.' }
      else
        format.html { redirect_to root_url, notice: 'Unable to add friend.' }
      end
    end
  end

  def accept_friendship
    @friendship = Friendship.find_by(friendship_params)
    return unless @friendship
  
    @friendship.confirmed = true
    if @friendship.save
      redirect_to friendships_path(@user), notice: 'Friend Request Accepted!'
    end
  end

  # def delete_friendship
  #   @friendship = Friendship.find_by(friendship_params)
  #   return unless @friendship

  #   @friendship.confirmed = false
  #   @friendship.destroy
  #   redirect_to friendships_path(@user.id), notice: 'Friend Request Not Accepted.'
  # end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship = Friendship.find_by(friendship_params)
    return unless @friendship

    @friendship.confirmed = false
    @friendship.destroy
    redirect_to friendships_path(@user.id), notice: 'Friend Request Not Accepted.'
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
