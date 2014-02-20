class ApplicationController < ActionController::Base
  protect_from_forgery
  include Authem::ControllerSupport

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :address_1, :address_2, :desc, :city, :state, :zip, :user_id, :bg_color, :link_color, :wrapper_color, :text_color, :title_color, :subdomain, :custom_domain, :schools_url, :autoplay, :transition, :mode, :ken_burns)
  end

  def ensure_user_owns_tour
    redirect_to :root unless tour.user.id == current_user.id
  end

end
