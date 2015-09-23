class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      # login user
      session[:user_id] = user.user_id
      # go to profile page
      redirect_to user
    else
      # handle error
      redirect_to sessions_new_path
    end
  end

  def destroy
    # logout
    session[:user_id] = nil
  end

end
