class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "管理者の登録に成功しました。"
      render :show
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
      render :new
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "管理者の更新に成功しました。"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = @user.errors.full_messages.join("<br>").html_safe
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = "管理者の削除に成功しました。"
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password_digest)
    end
end
