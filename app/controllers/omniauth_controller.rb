class OmniauthController < ApplicationController
  skip_before_action :authenticate_user, only: [:callback]    
    
  def callback
    auth = request.env['omniauth.auth']
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      log_in user
      redirect_to user, success: "Twitterでログインしました。"
    end
  end
