class ToursController < AuthenticatedController
  expose(:tours) { current_user.tours.order("live desc, address_1 asc") }
  expose(:tour, attributes: :tour_params)
  expose(:user) { current_user }

  def new
    redirect_to first_tour_path if user.name.blank?
  end

  def create
    tour.save
    tour.set_default_colors
    consider_free_tour
    redirect_to tour_property_info_path(tour)
  end

  def takedown
    tour.update_attribute :live, false
    flash[:update] = "Your tour has been taken down."
    redirect_to tour_property_info_path(tour) and return
  end

  private

  def consider_free_tour
    if user.has_free_tours?
      User.decrement_counter :free_tours, user.id
      tour.update_attribute :paid, true
    end
  end

end
