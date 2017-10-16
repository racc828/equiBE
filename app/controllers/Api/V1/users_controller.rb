class Api::V1::UsersController < ApplicationController

  def index
    users = User.all
    render json: users
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user.present?
      render json: {
        error: "User Exists Already"
      }, status: 404
    else
      newUser = User.create(user_params)
      render json: {
        id: newUser.id,
        username: newUser.username,
        firstname: newUser.firstname,
        lastname: newUser.lastname,
        email: newUser.email,
        fullname: newUser.fullname,
        jwt: JWT.encode({id: newUser.id}, "equidestined")
      }
    end
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
    usersFullNames = User.all.map {|user|
      user.fullname
    }
    foundUsers = usersFullNames.map {|fullname|
      if fullname.include?(params[:fullname])
        User.all.find_by(fullname: fullname)
      end
    }
    matches = foundUsers.compact
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
    params.require(:user).permit(:firstname, :lastname, :email, :username, :password, :fullname)
  end

end
