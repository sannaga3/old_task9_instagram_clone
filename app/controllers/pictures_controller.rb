class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    if params[:back]
      @picture = Picture.new(picture_params)
    else
      @picture = Picture.new
    end
  end

  def confirm
    @picture = Picture.new(picture_params)
    @picture.id = params[:id]
    @picture.user_id = current_user.id
    if @picture.id?
      render :edit and return if @picture.invalid?
    else
      render :new if @picture.invalid?
    end
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def picture_params
    params.require(:picture).permit(:content, :id, :post_image, :post_image_cache, :image, :image_cache)
  end
end
