class UsersController < ApplicationController
  before_action :logged_in?, only: [:index, :show]

  def index
    @user_count = User.all.length
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
