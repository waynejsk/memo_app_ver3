class Admin::UsersController < ApplicationController
  before_action :require_admin
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      redirect_to admin_users_url, alert: 'このユーザーは削除できません'
    else
      @user.destroy 
      redirect_to admin_users_url, notice: "ユーザー「#{@user.name}」を削除しました"
    end
  end

  private

    def require_admin
      redirect_to root_url unless current_user.admin?
    end

    def user_params
      params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
    end
end
