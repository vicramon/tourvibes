class PreviewTourController < AuthenticatedController
  expose(:tours) { current_user.tours }
  expose(:tour)

  def show
    @pics = tour.photos
    @realtor = tour.user

    if @pics.size == 0
      flash[:message] = "You must upload photos before you can preview your tour."
      redirect_to tour.edit_photos_path and return
    end

    render :layout => 'view_tour'
  end

end
