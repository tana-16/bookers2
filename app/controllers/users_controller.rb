class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.new
    @userss = User.all

    # @user = User.find(params[:id])

  end

  def show
    @user = User.find(params[:id])
    @users = User.new
    # @userss = User.find(params[:id])
    @userss = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def user_params
    params.rperimt(:title, :body)
  end

end


