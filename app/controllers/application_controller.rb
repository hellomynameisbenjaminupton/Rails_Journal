class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :set_time_zone

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username])
  end

  private

  def set_time_zone(&block)
    if current_user && current_user.timezone.present?
      Time.use_zone(current_user.timezone, &block)
    else
      Time.use_zone('UTC', &block)  # Default to UTC if no timezone set
    end
  end
end