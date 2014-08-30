class PhotosController < ApplicationController

  def index
    @photos = Photo.all.order("vote_count DESC").limit(20)
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo
    else
      render :index
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:url, :title)
  end
end
