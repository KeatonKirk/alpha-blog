class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Alpha Blog #{@user.username}!"
        redirect_to user_path(@user)
      else
        render 'new'
      end
  end

  def edit
    set_user
  end

  def update
    set_user
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
    set_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end


end
