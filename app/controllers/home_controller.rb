class HomeController < ApplicationController
  # before_filter :require_ssl_on_production

  def index
    redirect_to :tours if current_user
  end


  private

  # def require_ssl_on_production
  #   redirect_to 'https://tourvibes.com' if Rails.env.production? and not request.ssl?
  # end

end
