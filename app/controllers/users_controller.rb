class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:notice] = "User was successfully created!"
        redirect_to user_path(@user)
      else
        render 'new'
      end
  end

  def show
    set_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

def set_user
  @user = User.find(params[:id])
end
