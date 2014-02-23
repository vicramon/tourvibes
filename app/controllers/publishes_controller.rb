class PublishesController < EditTourController

  def show
    if Rails.env.production? and !request.ssl?
      redirect_to "https://tourvibes.herokuapp.com/secure_login/#{current_user.login_hash}/#{tour.id}"
      return
    end

    if tour.no_live_path?
      message = "You must enter a subdomain or custom domain before you can publish your tour."
      redirect_to tour_settings_path(tour), error: message and return
    end

    if tour.photos.empty?
      message = "You must upload photos before you can publish your tour."
      redirect_to tour_photos_path(tour), error: message and return
    end

    render :already_paid and return if tour.paid?
  end

  def update
    tour.save if tour.paid?
    redirect_to tour_now_live_path(tour)
  end

end
