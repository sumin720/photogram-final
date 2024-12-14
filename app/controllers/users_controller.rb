class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:feed, :liked_photos, :discover]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @photos = @user.photos
  end

  def feed
    @feed_photos = current_user.following_users.joins(:photos).select('photos.*')
  end

  def liked_photos
    @liked_photos = current_user.liked_photos
  end

  def discover
    following_ids = current_user.following_users.pluck(:id)
    @suggested_users = User.where.not(id: following_ids + [current_user.id])
  end
end
