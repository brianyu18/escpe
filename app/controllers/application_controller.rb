class ApplicationController < ActionController::Base
  helper_method :current_user


  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def logged_in_user_id
    session[:user_id]
  end

  def logged_in?
    !!logged_in_user_id
  end

  def authorized?(user_id)
    logged_in_user_id == user_id
  end


end
