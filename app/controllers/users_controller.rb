class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters

  def show
    @user = User.find(params[:id])
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :avatar])
  end
  
end