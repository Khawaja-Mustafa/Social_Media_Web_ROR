class Api::V1::AccountsController < ApplicationController
  def index
    account = Account.new( username: account_params[:username], email: account_params[:email], password: account_params[:password])
    if account.save
      render json: account, status: 200
    else
      render json: {error: "Error creating review."}
    end
  end

  def show
    account = Account.find_by(id: params[:id])
    if account
      render json: account, status: 200
    else
      render json: {error: "account not found"}
    end
  end

  private
    def account_params
      params.(:account).permit([:username, :email, :password])
    end
end
