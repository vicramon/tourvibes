class PhotosController < EditTourController

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

end
