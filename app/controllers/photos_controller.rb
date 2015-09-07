class PhotosController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = current_user.photos.create(photo_params)
    redirect_to photos_path
  end

  def show
    @photo = Photo.find(params[:id])
    @comment = Comment.new
  end

  def photo_params
    params.require(:photo).permit(:description, :image)
  end
end
