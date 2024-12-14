class UsersController < ApplicationController
  def show
    @user = User.find_by(username: params[:id])
    @photos = @user.photos
  end
end
