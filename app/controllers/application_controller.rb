class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def require_login
  	redirect_to "/users/new" unless session[:user_id]
  end
  
  def require_correct_user
  	@user = User.find(params[:id])
  	@current = User.find(session[:user_id])
  	redirect_to "/show/#{@current.id}" unless @user == @current
  end
end