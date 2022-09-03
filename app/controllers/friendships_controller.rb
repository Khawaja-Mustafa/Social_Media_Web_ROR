class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[ show edit update destroy ]

  # GET /friendships or /friendships.json
  # def index
  #   @friendships = Friendship.all
  # end

  # GET /friendships/1 or /friendships/1.json
  # def show
  # end

  # GET /friendships/new
  # def new
  #   @friendship = Friendship.new
  # end

  # GET /friendships/1/edit
  # def edit
  # end

  # POST /friendships or /friendships.json
  def create
  @friendship = current_account.friendships.build(:friend_id => params[:friend_id])
  if @friendship.save
    flash[:notice] = "Added friend."
    redirect_to root_url
  else
    flash[:error] = "Unable to add friend."
    redirect_to root_url
  end
end

  # PATCH/PUT /friendships/1 or /friendships/1.json
  # def update
  #   respond_to do |format|
  #     if @friendship.update(friendship_params)
  #       format.html { redirect_to friendship_url(@friendship), notice: "Friendship was successfully updated." }
  #       format.json { render :show, status: :ok, location: @friendship }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @friendship.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /friendships/1 or /friendships/1.json
  def destroy
    @friendship = current_account.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_account
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.require(:friendship).permit(:account_id, :friend_id, :create, :destroy)
    end
end