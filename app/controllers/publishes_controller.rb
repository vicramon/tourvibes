class PublishesController < EditTourController

  def show
    if tour.no_live_path?
      message = "You must enter a subdomain or custom domain before publishing your tour."
      redirect_to tour_settings_path(tour), update: message and return
    end
    render :already_paid and return if tour.paid?
  end

  def update
    tour.save
    redirect_to tour_now_live_path(tour)
  end

  def publish
    if tour.paid?
      tour.update_attribute(:live, true)
      redirect_to tour_now_live_path(tour)
    end

    # TODO - user pays for tour
    # if Rails.env.production? and not request.ssl?
    #   redirect_to "https://tourvibes.com/secure_login/#{tour.id}"
    # end
  end

end
