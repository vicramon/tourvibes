class PublishesController < EditTourController

  def publish
    if !tour.is_paid and current_user.free_tours?
      tour.is_paid = true
      current_user.free_tours -= 1
      current_user.save
    end

    if tour.is_paid?
      tour.update_attribute(:is_live, true)
      redirect_to now_live_path
    end

    # TODO - user pays for tour
    # if Rails.env.production? and not request.ssl?
    #   redirect_to "https://tourvibes.com/secure_login/#{tour.id}"
    # end
  end
end
