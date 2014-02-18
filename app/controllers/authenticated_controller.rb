class AuthenticatedController < ApplicationController
  before_filter :require_user

  private

  def require_user
    redirect_to '/login' unless @user
  end

end
