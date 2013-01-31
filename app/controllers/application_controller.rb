class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup
  
  def setup
    if Rails.env.production? and not request.ssl?
      redirect_to 'https://tourvibes.com' and return
    end
    
    @user = User.find_by_id(session[:user_id])
  end
  
end
