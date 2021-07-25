class UsersController < ApplicationController
  def index
    @user = current_user
    # @users = User.new
    @users = Book.new
    @userss = User.all

    # @user = User.find(params[:id])

  end

  def show
    @user = User.find(params[:id])
    # @users = User.new
    @users = Book.new
    @book = @user.books
    # @userss = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      
      if @user.save
        flash[:success] = 'You have updated user successfully.'
        redirect_to user_path(@user.id)
      else
        flash[:danger] = ''
      end
        
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  

end


