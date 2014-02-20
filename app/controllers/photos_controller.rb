class PhotosController < EditTourController

  def update
    tour.save

    flash[:update] = true
    if params[:commit] == "Save Descriptions"
      redirect_to tour_photos_path(tour)
    else
      redirect_to tour_music_path(tour)
    end
  end

end
