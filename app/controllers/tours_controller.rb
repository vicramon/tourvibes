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

  def update
    tour.save

    if params[:commit] == "Save Changes"
      flash.now[:update] = 'yes'
    else
      flash[:update] = 'yes'
      redirect_to tour.edit_photos_path and return
    end
  end

  def edit_music
    if request.post?
      tour.music_file = params[:music_file]
      tour.autoplay_music = params[:autoplay_music]
      tour.save

      if params[:music].present?
        tour.music_file = nil
        tour.save
        if tour.music
          @music = tour.music
          @music.music = params[:music]
        else
          @music = Upload.new(:music => params[:music])
          @music.brand = "music"
          @music.tour_id = tour.id
        end
        @music.save
      end

      if params[:commit] == "Save Changes"
        flash.now[:update] = 'yes'
      else
        flash[:update] = 'yes'
        redirect_to tour.edit_settings_path and return
      end

      if not params[:music].present? and params[:music_file].present? and tour.music
        tour.music.destroy
      end
    end
  end

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

  def edit_photos
    @pics = tour.photos
    if request.post?
      i = 0
      for title in params[:title]
        @pics[i].room_name = title
        @pics[i].save
        i += 1
      end

      if params[:commit] == "Save Descriptions"
        flash.now[:update] = 'yes'
      else
        flash[:update] = 'yes'
        redirect_to tour.edit_music_path and return
      end

    end
  end

  def takedown
    tour.update_attribute :is_live, false
    flash[:update] = 'yes'
    redirect_to tour.edit_path and return
  end

  private

  def tour_params
    params.require(:tour).permit(:address_1, :address_2, :desc, :city, :state, :zip, :user_id, :bg_color, :link_color, :wrapper_color, :text_color, :title_color, :subdomain, :custom_domain, :schools_url, :autoplay, :transition, :mode, :ken_burns)
  end

  def ensure_user_owns_tour
    redirect_to :root unless tour.user.id == current_user.id
  end

end
