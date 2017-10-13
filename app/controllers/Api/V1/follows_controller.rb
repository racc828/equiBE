class Api::V1::FollowsController < ApplicationController

  def follow_user
    user = User.find(params[:following_id])
    current_user.following << user
    render json: user
  end

end
