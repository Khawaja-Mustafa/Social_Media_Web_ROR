class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username first_name last_name email password avatar, avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username, password, password_confirmation, current_password, avatar, avatar_cache, remove_avatar])
     # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :avatar, :avatar_cache, :remove_avatar) }
  end
end
