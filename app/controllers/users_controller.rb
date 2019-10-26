class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show, :new, :create, :edit, :update] 
  
  def index
    @users = User.all.page(params[:page])
  end

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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, success: "編集に成功しました。"
    else
      flash.now[:danger] = "ユーザの編集に失敗しました。"
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end