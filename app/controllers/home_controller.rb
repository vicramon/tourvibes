class HomeController < ApplicationController
  # before_filter :require_ssl_on_production

  def index
    redirect_to :tours if current_user
  end

  # TODO: -login on ssl?
  # def secure_login
  #   @page = "login"
  #   @tour = House.find_by_id(params[:id])

  #   if request.post?
  #     u = User.find(:first, :conditions => {:email => params[:email].strip})
  #     if u
  #       if u.password == Digest::SHA2.hexdigest(u.salt + params[:password].strip)
  #         session[:user_id] = u.id
  #         redirect_to @tour.publish_path and return
  #       end
  #     end
  #     flash[:error] = "yes"
  #   end
  # end

  private

  # def require_ssl_on_production
  #   redirect_to 'https://tourvibes.com' if Rails.env.production? and not request.ssl?
  # end

end
