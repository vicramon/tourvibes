class LiveTourController < ApplicationController

  def live
    @pics = @tour.photos
    @realtor = @tour.user

    if not @tour.is_paid or not @tour.is_live
      redirect_to @tour.not_live_path and return
    end
    render :template => '/tour/preview', :layout => 'view_tour'
  end

end
