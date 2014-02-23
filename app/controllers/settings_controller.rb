class SettingsController < EditTourController

  def update
    tour.attributes = tour_params
    HerokuDomainManager.update(tour)
    downcase_domains(tour)

    if tour.save
      if params[:commit] == "Save Changes"
        redirect_to tour_settings_path(tour), update: true
      else
        redirect_to tour_publish_path(tour)
      end
    else
      error = tour.errors.full_messages.map { |error| "#{error}<br />" }.join.html_safe
      redirect_to tour_settings_path, error: error
    end
  end

  private

  def downcase_domains(tour)
    tour.subdomain = tour.subdomain.try(:downcase)
    tour.custom_domain = tour.custom_domain.try(:downcase)
  end

end
