class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @photo = Photo.find(params[:photo_id])
    @like = @photo.likes.build(fan: current_user)
    if @like.save
      redirect_to @photo, notice: 'Photo was successfully liked.'
    else
      redirect_to @photo, alert: 'Failed to like photo.'
    end
  end

  def destroy
    @like = current_user.likes.find_by(photo_id: params[:photo_id])
    @like.destroy
    redirect_to @like.photo, notice: 'Like was successfully removed.'
  end
end

