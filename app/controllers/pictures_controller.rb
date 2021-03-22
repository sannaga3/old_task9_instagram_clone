class PicturesController < ApplicationController
  before_action :set_picture, only: [:edit, :show, :update,:destroy]
  before_action :ensure_current_user, only: [:edit, :update]

  def index
    @pictures = Picture.all
    if params[:name] == "asc"
      @pictures = @pictures.order(id: :asc)
    elsif params[:name] == "desc"
      @pictures = @pictures.order(id: :desc)
    elsif params[:name] == "with_image"
      @pictures = @pictures.where.not(post_image: nil)
    end  
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture =  Picture.new(picture_params)
    @picture.id = params[:id]
    @picture.user_id = current_user.id
    if @picture.id?
      render :edit and return if @picture.invalid?
    else
      render :new if @picture.invalid?
    end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
    else
      if @picture.save
        PictureMailer.picture_mail(@picture).deliver 
        redirect_to pictures_path, notice: "投稿しました"
      else
        render :new
      end
    end
  end

  def show
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def edit
  end
  
  def update
    if params[:back]
      render :edit
    else
      if @picture.update(picture_params)
        redirect_to picture_path(@picture.id), notice: "編集しました"
      else
        render :edit
      end
    end
  end

  def destroy
    
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end

  private
  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:content, :id, :post_image, :post_image_cache, :image, :image_cache)
  end
  def ensure_current_user
    if @current_user.id != @picture.user_id
      redirect_to pictures_path, notice: "権限がありません"
    end
  end
end
