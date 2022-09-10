class RoomsController < ApplicationController
  def index
    @current_account = current_account
    redirect_to '/signin' unless @current_account
    @rooms = Room.public_rooms
    @account = Account.all_except(@current_account)
  end
  def create
    @room = Room.create(name: params["room"]["name"])
  end
  def show
    @current_account = current_account
    @single_room = Room.find(params[:id])
    @rooms = Room.public_rooms
    @account = Account.all_except(@current_account)
    @room = Room.new
    @message = Message.new
    @messages = @single_room.messages
    render "index"
  end
end
