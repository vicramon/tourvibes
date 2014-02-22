class SettingsController < EditTourController

  def update
    tour.attributes = tour_params
    HerokuDomainManager.update(tour)
    downcase_domains(tour)
    tour.save

    if params[:commit] == "Save Changes"
      flash[:update] = true
      redirect_to tour_settings_path(tour)
    else
      redirect_to tour_publish_path(tour)
    end
  end

  private

  def downcase_domains(tour)
    tour.subdomain = tour.subdomain.try(:downcase)
    tour.custom_domain = tour.custom_domain.try(:downcase)
  end

end
