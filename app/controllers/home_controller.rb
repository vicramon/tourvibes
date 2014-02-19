class HomeController < ApplicationController
  before_filter :require_ssl_on_production

  def index
    @page = 'home'
    redirect_to '/tours' and return if @user
    @page_action = params[:page_action]
  end

  def start
    redirect_to '/tour/new' if @user
  end

  def contact
    @page = "contact"
  end

  def secure_login
    @page = "login"
    @tour = House.find_by_id(params[:id])

    if request.post?
      u = User.find(:first, :conditions => {:email => params[:email].strip})
      if u
        if u.password == Digest::SHA2.hexdigest(u.salt + params[:password].strip)
          session[:user_id] = u.id
          redirect_to @tour.publish_path and return
        end
      end
      flash[:error] = "yes"
    end
  end

  def register
    @user = User.new
    @user.email = params[:email].strip
    @user.salt = Digest::SHA2.hexdigest(params[:email] + rand(100).to_s)
    @user.password = Digest::SHA2.hexdigest(@user.salt + params[:password].strip)
    @user.free_tours = 5
    @user.save
    session[:user_id] = @user.id
    redirect_to '/tour/first' and return
  end

  private

  def require_ssl_on_production
    redirect_to 'https://tourvibes.com' if Rails.env.production? and not request.ssl?
  end

end
