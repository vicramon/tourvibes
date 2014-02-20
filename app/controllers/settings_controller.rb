class SettingsController < EditTourController

  def edit_settings
    if request.post?
      tour.save

      if tour.custom_domain_changed
        require 'heroku-api'
        client = Heroku::API.new(ENV.fetch('HEROKU_API_KEY'))
        client.post_domain('realtour', tour.custom_domain)
        client.post_domain('realtour', 'www.' + tour.custom_domain)
        client.delete_domain('realtour', tour.custom_domain_was)
        client.delete_domain('realtour','www.' + tour.custom_domain_was)
      end

      if params[:commit] == "Save Changes"
        flash.now[:update] = 'yes'
      else
        flash[:update] = 'yes'
        redirect_to tour.publish_path and return
      end
    end
  end

end
