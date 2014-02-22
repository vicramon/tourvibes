class PublishesController < EditTourController

  def show
    if Rails.env.production? and !request.ssl?
      redirect_to "https://tourvibes.herokuapp.com/secure_login/#{current_user.login_hash}/#{tour.id}"
    end

    if tour.no_live_path?
      message = "You must enter a subdomain or custom domain before publishing your tour."
      redirect_to tour_settings_path(tour), update: message and return
    end

    render :already_paid and return if tour.paid?
  end

  def update
    tour.save if tour.paid?
    redirect_to tour_now_live_path(tour)
  end

end
