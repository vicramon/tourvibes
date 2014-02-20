class PropertyInfosController < EditTourController
  layout 'edit_tour'

  def update
    tour.save
    flash[:update] = true

    if params[:commit] == "Save Changes"
      redirect_to tour_property_info_path(tour)
    else
      redirect_to tour_photos_path(tour)
    end
  end

end
