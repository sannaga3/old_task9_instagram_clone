class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def confirm
    @user = params[:id] ? User.find(params[:id]) : User.new(user_params)
    if @user.id?
      @user.assign_attributes(user_params)
      render :edit and return if @user.invalid?(:edit_case)
    else
      @user.id =  params[:id] ? params[:id] : nil
      render :new if @user.invalid?
    end
  end

  def show
    
  end

  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
