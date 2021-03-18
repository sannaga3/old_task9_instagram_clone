class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  skip_before_action :login_required, only: [:new, :create]
  def new
    if params[:back]
      @user = User.new(user_params)
    else
      @user = User.new
    end
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

  def edit
  end

  def update
    if params[:back]
      render :edit
    else
      if @user.update(user_params)
        redirect_to user_path(@user.id), notice: "プロフィール編集しました！"
      else
        render :edit
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :image, :image_cache, :password, :password_confirmation)
  end
end
