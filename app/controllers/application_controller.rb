class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :danger
  
  before_action :authenticate_user

  include SessionsHelper

  private
    def authenticate_user
      unless logged_in?
        redirect_to login_url
      end
    end
  end