class FriendshipsController < ApplicationController
  def create
    @friendship = current_account.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to profile_account_path(current_account)
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  def destroy
    @friendship = current_account.friendships.find(params[:id])
    if @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to profile_account_path(current_account)
    else
      flash[:notice] = "friendship not removed."
      redirect_to root_url
    end
  end

end
