class Api::V1::FollowsController < ApplicationController

  def follow_user
    user = User.find(params[:following_id])
    current_user.following << user
    render json: user
  end

  def unfollow_friend
    friend = Follow.all.find { |follower| follower.following_id === params[:user_id] && current_user.id === follower.user_id }
    friend.destroy
    followers =  current_user.following
    render json: followers
  end

  def my_friends
    myfriends = current_user.following
    render json: myfriends
  end

end
