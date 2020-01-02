class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create] 

  def new
  end

  def create
    auth = request.env['omniauth.auth']
    if auth.present?
      user = User.find_or_create_from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
      redirect_to user, success: "ログインしました。"
    elsif user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user, success: "ログインしました。"
    else
      flash.now[:danger] = "メールとパスワードの組み合わせが間違っています！"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url, success: "ログアウトしました。"
  end
end