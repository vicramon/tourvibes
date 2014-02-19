class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authem::ControllerSupport
  before_filter :setup

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def setup
    @user = User.find_by_id(session[:user_id])
  end

end
