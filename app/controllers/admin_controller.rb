class AdminController < ApplicationController
  #before_filter :require_super_admin
  
  def require_super_admin
    if not @user.is_super_admin
      redirect_to '/login' and return
    end
    @page = 'admin'
  end
  
  def make_admin
    user = User.find_by_id(params[:id])
    user.is_super_admin = true
    user.save
    redirect_to '/admin'
  end
  
  def index
    
  end
  
  
  
end