class ToursController < AuthenticatedController
  expose(:tours) { current_user.tours }
  expose(:tour, attributes: :tour_params)

    # TODO - find tour on subdomain and custom domain
    # if params[:id]
    #   Tour.find_by_id(params[:id])
    # elsif request.subdomain.present? && request.subdomain != 'www'
    #   Tour.find_by_subdomain!(request.subdomain.downcase)
    # else
    #   Tour.find_by_custom_domain(request.domain.downcase)
    # end
  # end

  def create
    tour.save
    tour.set_default_colors
    redirect_to tour_property_info_path(tour)
  end

  def update
    tour.save

    if params[:commit] == "Save Changes"
      flash.now[:update] = 'yes'
    else
      flash[:update] = 'yes'
      redirect_to tour.edit_photos_path and return
    end
  end

  def takedown
    tour.update_attribute :live, false
    flash[:update] = 'yes'
    redirect_to tour.edit_path and return
  end

  private

  def tour_params
    params.require(:tour).permit(:address_1, :address_2, :desc, :city, :state, :zip, :user_id, :bg_color, :link_color, :wrapper_color, :text_color, :title_color, :subdomain, :custom_domain, :schools_url, :autoplay, :transition, :mode, :ken_burns)
  end

  def ensure_user_owns_tour
    redirect_to :root unless tour.user.id == current_user.id
  end

end
