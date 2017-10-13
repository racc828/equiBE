class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    render json: {
      id: user.id,
      username: user.username,
      firstname: user.firstname,
      lastname: user.lastname,
      email: user.email,
      jwt: JWT.encode({id: user.id}, "equidestined")
    }
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def update
    user = User.find_by(id: params[:id])
    user.update(user_params)
    render json: user
  end

  def find_friends
    newUsers = User.all.map {|user|
      if user.firstname === params[:firstname]
        user
      end
    }
    matches = newUsers.compact
    render json: matches
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.destroy
    users = User.all
    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password)
  end

end
