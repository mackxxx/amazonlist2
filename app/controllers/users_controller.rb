class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create, :update, :edit] 
  
  def show
    @user = User.find(params[:id])
    @items = @user.items.uniq
    @count_want = @user.want_items.count
    @count_desire = @user.desire_items.count
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user, success: "登録に成功しました。"
    else
      flash.now[:danger] = "ユーザの登録に失敗しました。"
      render :new
    end
  end

  def update
  end

  def edit
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end