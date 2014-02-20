class PreviewsController < EditTourController
  expose(:realtor) { tour.user }
  layout 'view_tour'

  def show
    @realtor = tour.user
    if tour.photos.size == 0
      flash[:message] = "You must upload photos before you can preview your tour."
      redirect_to tour_photos_path(tour)
    end
  end

end
