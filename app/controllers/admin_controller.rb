class AdminController < ApplicationController
  before_filter :require_super_admin

  def make_admin
    user = User.find_by_id(params[:id])
    user.update_attribute :super_admin, true
    redirect_to '/admin'
  end

  private

  def require_super_admin
    redirect_to '/login' unless @user and @user.is_super_admin
    @page = 'admin'
  end

end
