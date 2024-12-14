class FollowRequestsController < ApplicationController
  before_action :authenticate_user!

  def create
    recipient = User.find(params[:recipient_id])
    follow_request = current_user.sent_follow_requests.build(recipient: recipient)

    if follow_request.save
      flash[:notice] = "Follow request sent to #{recipient.username}."
    else
      flash[:alert] = "Unable to send follow request."
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    follow_request = current_user.sent_follow_requests.find(params[:id])
    follow_request.destroy
    flash[:notice] = "Follow request canceled."
    redirect_back(fallback_location: root_path)
  end
end

