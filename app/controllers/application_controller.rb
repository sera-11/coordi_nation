class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :set_time_zone, if: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username])
  end

  private

  def set_time_zone
    Time.zone = 'Central Time (US & Canada)'
  end


end
