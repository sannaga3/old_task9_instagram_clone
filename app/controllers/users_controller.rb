class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update,:destroy]
  
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

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else
      if @user.save
        redirect_to user_path(@user.id), notice: "ユーザー登録完了しました！"
      else
        render :new
      end
    end
  end

  def show

  end

  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
