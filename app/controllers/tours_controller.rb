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

  def takedown
    tour.update_attribute :live, false
    flash[:update] = 'yes'
    redirect_to tour_edit_path(tour) and return
  end

end
