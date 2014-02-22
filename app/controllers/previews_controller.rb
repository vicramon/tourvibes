class PreviewsController < EditTourController
  expose(:realtor) { tour.user }
  layout 'view_tour'

  def show
    @realtor = tour.user
    if tour.photos.empty?
      redirect_to tour_photos_path(tour), update: "You must upload photos before you can preview your tour."
    end
  end

end
