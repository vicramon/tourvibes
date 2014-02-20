class MusicsController < EditTourController

  def update
    tour.save

    flash[:update] = 'yes'
    if params[:commit] == "Save Changes"
      redirect_to tour_music_path
    else
      redirect_to tour_settings_path
    end
  end

end
