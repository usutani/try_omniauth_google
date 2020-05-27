class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.save
      cookies.encrypted[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to new_session_path
    end
  end

  def destroy
    cookies.delete(:user_id)
    redirect_to new_session_path
  end
end
