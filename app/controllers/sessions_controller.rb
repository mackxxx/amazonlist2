class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create, :destroy] 

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
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