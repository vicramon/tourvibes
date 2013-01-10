class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup
  
  def setup
    @user = User.find_by_id(session[:user_id])
  end
  
end
