class HomeController < ApplicationController
  
  def index
    @page = 'home'
  end
  
  def contact
    @page = "contact"
  end
  
  def login    
    @page = "login"
    if request.post?     
      u = User.find(:first, :conditions => {:email => params[:email].strip})
      if u
        if u.password == Digest::SHA2.hexdigest(u.salt + params[:password].strip)
          session[:user_id] = u.id
          redirect_to '/' and return
        end
      end
      flash[:error] = "yes"
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to '/' and return
  end
  
  def register
    @user = User.new
    @user.email = params[:email].strip
    @user.salt = Digest::SHA2.hexdigest(params[:email] + rand(100).to_s)
    @user.password = Digest::SHA2.hexdigest(@user.salt + params[:password].strip)
    @user.save
    session[:user_id] = @user.id
    redirect_to '/tour/new' and return
  end
  
end

