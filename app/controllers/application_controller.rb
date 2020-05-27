class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    User.find(cookies.encrypted[:user_id]) if cookies.encrypted[:user_id]
  end
end
