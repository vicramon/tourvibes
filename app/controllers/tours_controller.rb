class ToursController < AuthenticatedController
  expose(:tours) { current_user.tours }
  expose(:tour, attributes: :tour_params)

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
