class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :set_time_zone, if: :user_signed_in?
  

  private

  def set_time_zone
    Time.zone = 'Central Time (US & Canada)'
  end
end
