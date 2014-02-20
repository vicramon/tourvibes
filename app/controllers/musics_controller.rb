class MusicsController < EditTourController

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

end
