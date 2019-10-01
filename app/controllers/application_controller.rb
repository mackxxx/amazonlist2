class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  
  include SessionsHelper

  private
    def require_user_logged_in
      if not logged_in?
        redirect_to login_url
      end
    end
  end