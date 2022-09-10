class AccountsController < ApplicationController
  def index
  end

  def show
    @account = Account.find(params[:id])
    @current_account = current_account
  end

  # def show
  #   @account = Account.find(params[:id])
  #   @current_account = current_account
  #   @rooms = Room.public_rooms
  #   @account = Account.all_except(@current_account)
  #   @room = Room.new
  #   @message = Message.new
  #   @room_name = get_name(@account, @current_account)
  #   @single_room = Room.where(name: @room_name).first || Room.create_private_room([@account, @current_account], @room_name)
  #   @messages = @single_room.messages
  #   render "rooms/index"
  # end

  # private
  # def get_name(account1, account2)
  #   accounts = [account1, account2].sort
  #   "private_#{accounts[0].id}_#{accounts[1].id}"
  # end
end