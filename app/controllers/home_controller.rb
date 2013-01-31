class HomeController < ApplicationController
  
  def index
    @page = 'home'
    
    #if @user
    #  redirect_to '/tours' and return
    #end
    
    @page_action = params[:page_action]
  end
  
  def start
    if @user
      redirect_to '/tour/new' and return
    end
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
  
  def login    
    @page = "login"
    if request.post?     
      u = User.find(:first, :conditions => {:email => params[:email].strip})
      if u
        if u.password == Digest::SHA2.hexdigest(u.salt + params[:password].strip)
          session[:user_id] = u.id
          redirect_to '/tours' and return
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
    redirect_to '/tour/first' and return
  end
  
end

